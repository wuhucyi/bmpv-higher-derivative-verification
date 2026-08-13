#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "zlib"
require "open3"
require "pathname"
require "set"
require "yaml"

ROOT = File.expand_path("..", __dir__)
errors = []

def rel(path)
  Pathname.new(path).relative_path_from(Pathname.new(ROOT)).to_s
end

def record(errors, condition, message)
  errors << message unless condition
end

def markdown_blocks(text)
  text.scan(/^## ([^\n]+)\n(.*?)(?=^## |\z)/m).to_h
end

def load_yaml(path)
  YAML.safe_load(File.read(path), permitted_classes: [], permitted_symbols: [], aliases: false)
end

allowed_root = Set.new(%w[
  .git .gitattributes .github .gitignore CITATION.cff RIGHTS_AND_REUSE.md
  README.md for_ai for_humans
])
root_entries = Dir.children(ROOT).to_set
record(errors, root_entries == allowed_root,
       "root allowlist mismatch: #{(root_entries ^ allowed_root).to_a.sort.join(', ')}")

human_expected = Set.new(%w[
  FINAL_REPORT.pdf INDEPENDENT_AUDIT_PROMPT.md PROMPT.md README.md
  RESEARCH_JOURNEY.md SOLVING_PROCESS.pdf NOTATION_CROSSWALK.md
])
human_actual = Dir.children(File.join(ROOT, "for_humans")).to_set
record(errors, human_actual == human_expected,
       "for_humans file set mismatch: #{(human_actual ^ human_expected).to_a.sort.join(', ')}")

all_paths = Dir.glob(File.join(ROOT, "**", "*"), File::FNM_DOTMATCH)
               .reject { |p| p.include?("/.git/") || p.end_with?("/.git") }
files = all_paths.select { |p| File.file?(p) }

forbidden_ext = %w[.tex .sty .bst .wl .wls .m .mx]
files.each do |path|
  name = File.basename(path)
  rpath = rel(path)
  record(errors, rpath.bytes.all? { |b| b < 128 }, "non-ASCII filename: #{rpath}")
  record(errors, !File.symlink?(path), "symlink forbidden: #{rpath}")
  record(errors, !forbidden_ext.include?(File.extname(path).downcase),
         "forbidden source/cache extension: #{rpath}")
  record(errors, !%w[.DS_Store Thumbs.db].include?(name), "filesystem residue: #{rpath}")
  record(errors, File.size(path) <= 25 * 1024 * 1024, "file exceeds 25 MiB: #{rpath}")
end

text_ext = Set.new(%w[.md .yaml .yml .cff .rb .log .gitignore .gitattributes])
prohibited = /[\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff\uac00-\ud7af\u0400-\u052f\u0590-\u05ff\u0600-\u06ff\u0900-\u097f\u0e00-\u0e7f]/
files.each do |path|
  ext = File.extname(path)
  next unless text_ext.include?(ext) || %w[.gitignore .gitattributes].include?(File.basename(path)) || ext == ".nb"

  raw = File.binread(path)
  text = raw.force_encoding("UTF-8").scrub
  record(errors, !text.match?(prohibited), "prohibited-script prose: #{rel(path)}")
  text.scan(/\\:([0-9a-fA-F]{4})/).flatten.each do |hex|
    char = [hex.to_i(16)].pack("U")
    record(errors, !char.match?(prohibited), "encoded prohibited-script prose: #{rel(path)} \\:#{hex}")
  end
  record(errors, !text.match?(%r{/(?:Users|home)/[^\s\"]+}), "absolute home path: #{rel(path)}")
  record(errors, !text.match?(%r{overleaf\.com/project/}), "private Overleaf project URL: #{rel(path)}")
  record(errors, !text.match?(/(?:github_pat_|ghp_)[A-Za-z0-9_]{20,}/), "possible GitHub token: #{rel(path)}")
end

yaml_files = files.select { |p| %w[.yaml .yml .cff].include?(File.extname(p)) }
yaml_files.each do |path|
  begin
    load_yaml(path)
  rescue StandardError => e
    errors << "YAML parse failure #{rel(path)}: #{e.message}"
  end
end

markdown_files = files.select { |p| File.extname(p) == ".md" }
markdown_files.each do |path|
  text = File.read(path, encoding: "UTF-8")
  text.scan(/\[[^\]]*\]\(([^)]+)\)/).flatten.each do |target|
    next if target.match?(%r{\A(?:https?://|mailto:)}) || target.start_with?("#")

    local = target.split("#", 2).first
    next if local.empty?
    resolved = File.expand_path(local, File.dirname(path))
    record(errors, resolved.start_with?(ROOT + File::SEPARATOR) && File.exist?(resolved),
           "broken or escaping link #{target} in #{rel(path)}")
  end
end

claims_path = File.join(ROOT, "for_ai/logic/claims.md")
claims_text = File.read(claims_path)
claim_blocks = markdown_blocks(claims_text).select { |id, _| id.match?(/\A(?:BMPV|MAP)-.*-\d{3}\z/) }
claim_ids = claim_blocks.keys.to_set
record(errors, claim_ids.length == 22, "expected 22 claims, found #{claim_ids.length}")

status_counts = Hash.new(0)
claim_to_exp = {}
claim_blocks.each do |id, block|
  status = block[/\*\*Status:\*\* `([^`]+)`/, 1]
  status_counts[status] += 1 if status
  record(errors, %w[established established_with_scope rejected_route not_established].include?(status),
         "invalid or missing status for #{id}")
  exp_ids = block.scan(/EXP-[A-Z0-9-]+-\d{3}/).uniq
  record(errors, exp_ids.length == 1, "#{id} must resolve to exactly one experiment")
  claim_to_exp[id] = exp_ids.first
  if status == "not_established"
    record(errors, block.include?("**Resolution needed:**"), "#{id} lacks resolution requirement")
  end
  if status == "rejected_route"
    record(errors, block.include?("**Superseded by:**"), "#{id} lacks supersession")
  end
end
expected_status = {
  "established" => 11,
  "established_with_scope" => 9,
  "rejected_route" => 1,
  "not_established" => 1
}
record(errors, status_counts == expected_status, "claim status counts differ: #{status_counts.inspect}")

experiments_path = File.join(ROOT, "for_ai/logic/experiments.md")
experiment_blocks = markdown_blocks(File.read(experiments_path)).each_with_object({}) do |(heading, block), out|
  id = heading[/\A(EXP-[A-Z0-9-]+-\d{3})/, 1]
  out[id] = block if id
end
experiment_ids = experiment_blocks.keys.to_set
record(errors, experiment_ids.length == 22, "expected 22 experiments, found #{experiment_ids.length}")

source_text = File.read(File.join(ROOT, "for_ai/src/index.md"))
source_rows = {}
source_text.each_line do |line|
  next unless line.start_with?("| NB")
  columns = line.split("|").map(&:strip).reject(&:empty?)
  next unless columns.length >= 7
  id, availability, file_cell, log_cell, tier, role, experiment = columns
  source_rows[id] = {
    "availability" => availability,
    "file" => file_cell.delete("`"),
    "log" => log_cell.delete("`"),
    "tier" => tier,
    "role" => role,
    "experiment" => experiment
  }
end
nb_ids = source_rows.keys.to_set
record(errors, nb_ids.length == 34, "expected 34 NB IDs, found #{nb_ids.length}")
record(errors, source_rows.values.count { |r| r["availability"] == "repository" } == 32,
       "expected 32 direct repository notebooks")
record(errors, source_rows.values.count { |r| r["availability"] == "repository_compressed" } == 2,
       "expected two compressed repository notebooks")
record(errors, source_rows.fetch("NB01", {})["availability"] == "repository_compressed" &&
               source_rows.fetch("NB02", {})["availability"] == "repository_compressed",
       "only NB01 and NB02 may be repository-compressed")
record(errors, source_rows.values.all? { |r| %w[repository repository_compressed].include?(r["availability"]) },
       "every notebook must be stored directly or as a repository-compressed object")

experiment_blocks.each do |id, block|
  verified = block[/\*\*Verifies:\*\* ([^\n]+)/, 1]&.scan(/(?:BMPV|MAP)-[A-Z0-9-]+-\d{3}/)&.uniq || []
  record(errors, verified.length == 1 && claim_ids.include?(verified.first), "#{id} has invalid claim backlink")
  if verified.length == 1
    record(errors, claim_to_exp[verified.first] == id, "claim/experiment mismatch for #{id}")
  end
  notebooks = block[/\*\*Notebooks:\*\* ([^\n]+)/, 1]&.scan(/NB\d{2}A?/)&.uniq || []
  record(errors, !notebooks.empty?, "#{id} has no notebooks")
  notebooks.each { |nb| record(errors, nb_ids.include?(nb), "#{id} references unknown #{nb}") }
end
record(errors, claim_to_exp.values.compact.to_set == experiment_ids,
       "claim-to-experiment mapping is not one-to-one and complete")

notebook_dir = File.join(ROOT, "for_ai/src/notebooks")
actual_notebooks = Dir.glob(File.join(notebook_dir, "*.nb")).map { |p| File.basename(p) }.to_set
expected_notebooks = source_rows.values.select { |r| r["availability"] == "repository" }.map { |r| r["file"] }.to_set
record(errors, actual_notebooks == expected_notebooks,
       "repository notebook basename set differs from source index")

actual_compressed = Dir.glob(File.join(notebook_dir, "*.nb.gz"))
                       .map { |p| File.basename(p) }.to_set
expected_compressed = source_rows.values
                                 .select { |r| r["availability"] == "repository_compressed" }
                                 .map { |r| r["file"] }.to_set
record(errors, actual_compressed == expected_compressed,
       "compressed repository notebook set differs from source index")

log_dir = File.join(ROOT, "for_ai/evidence/logs")
actual_logs = Dir.glob(File.join(log_dir, "*.log")).map { |p| File.basename(p) }.to_set
expected_logs = source_rows.values.map { |r| r["log"] }.to_set
record(errors, actual_logs == expected_logs, "canonical log set differs from source index")
record(errors, !actual_logs.include?("00_fresh_kernel_full_eval.log"), "stale NB00 log is forbidden")

source_rows.each do |id, row|
  log_path = File.join(log_dir, row["log"])
  next unless File.file?(log_path)
  log = File.binread(log_path).force_encoding("UTF-8").scrub
  logged_notebook = row["availability"] == "repository_compressed" ?
                    File.basename(row["file"], ".gz") : row["file"]
  record(errors, log.include?(logged_notebook), "#{id} log does not name its notebook")
  record(errors, log.include?("FRESH_KERNEL_FINAL_PASS=\"True"), "#{id} lacks terminal pass")
  record(errors, log.include?("FRESH_KERNEL_SEQUENTIAL_EVALUATION_END"), "#{id} lacks terminal end marker")
  next unless row["availability"] == "repository"

  notebook_path = File.join(notebook_dir, row["file"])
  next unless File.file?(notebook_path)
  sha = Digest::SHA256.file(notebook_path).hexdigest
  bytes = File.size(notebook_path)
  logged_sha = log[/SHA256=.*?([0-9a-f]{64})/, 1]
  logged_bytes = log[/BYTES=.*?(\d+)/, 1]&.to_i
  record(errors, sha == logged_sha, "#{id} notebook SHA differs from canonical log")
  record(errors, bytes == logged_bytes, "#{id} notebook bytes differ from canonical log")
end

archives = load_yaml(File.join(ROOT, "for_ai/evidence/notebook_archives.yaml"))
archive_rows = archives.fetch("compressed_notebooks").to_h { |row| [row.fetch("id"), row] }
record(errors, archive_rows.keys.to_set == Set.new(%w[NB01 NB02]), "compressed notebook IDs differ")
expected_archive_identity = {
  "NB01" => {
    "original_bytes" => 626_490_817,
    "original_sha256" => "6cd59e0afb36b55d5f7ea13e66e15a1b97cda0b4a12b98983edd98d5d2947679",
    "compressed_bytes" => 16_048_690,
    "compressed_sha256" => "e0b7c344cfa53666b1a25c818f8651849ad303a3814526a5bc6ddc9618009ef1"
  },
  "NB02" => {
    "original_bytes" => 52_605_901,
    "original_sha256" => "b89b1dc65e4ef8d06136df6dcd7053557bee3a17177a7ef3c65584f7bb80f928",
    "compressed_bytes" => 1_440_317,
    "compressed_sha256" => "ca3bd8af6bad7ab5492d65947b08c0938cb76adea1f36c098abfa6e40ab13847"
  }
}
archive_rows.each do |id, row|
  expected = expected_archive_identity.fetch(id, {})
  expected.each do |field, value|
    record(errors, row[field] == value, "#{id} #{field} metadata differs")
  end
  indexed = source_rows.fetch(id, {})["file"]
  expected_repository_file = "for_ai/src/notebooks/#{indexed}"
  record(errors, row["repository_file"] == expected_repository_file,
         "#{id} repository path differs from source index")
  path = File.join(ROOT, row.fetch("repository_file"))
  next unless File.file?(path)

  record(errors, File.size(path) == row["compressed_bytes"], "#{id} compressed byte count differs")
  record(errors, Digest::SHA256.file(path).hexdigest == row["compressed_sha256"],
         "#{id} compressed SHA-256 differs")
  restored_digest = Digest::SHA256.new
  restored_bytes = 0
  restored_tail = +"".b
  restored_privacy_patterns = {
    "encoded prohibited-script prose" => /\\:(?:0(?:4[0-9a-f]|5[0-2a-f]|59|5[0-9a-f]|6[0-9a-f]|7[0-9a-f]|8[0-9a-f]|9[0-7a-f]|e[0-9a-f]|f[0-9a-f])|3(?:0[4-9a-f]|[1-9a-f][0-9a-f])|4(?:[e-f][0-9a-f])|9(?:[0-7a-f][0-9a-f])|a(?:c[0-9a-f]|d[0-7a-f])|d(?:7[0-9a-f]))/i,
    "absolute home path" => %r{/(?:Users|home)/[^\s\"]+},
    "private Overleaf project URL" => %r{overleaf\.com/project/},
    "possible GitHub token" => /(?:github_pat_|ghp_)[A-Za-z0-9_]{20,}/
  }
  restored_privacy = restored_privacy_patterns.transform_values { false }
  restored_non_ascii = false
  begin
    Zlib::GzipReader.open(path) do |gz|
      record(errors, gz.mtime.to_i.zero? && gz.orig_name.to_s.empty?,
             "#{id} gzip header is not deterministic and metadata-free")
      while (chunk = gz.read(1024 * 1024)) && !chunk.empty?
        restored_digest.update(chunk)
        restored_bytes += chunk.bytesize
        window_bytes = restored_tail + chunk
        restored_non_ascii ||= window_bytes.match?(/[\x80-\xff]/n)
        restored_privacy_patterns.each do |finding, pattern|
          restored_privacy[finding] ||= window_bytes.match?(pattern)
        end
        restored_tail = window_bytes.byteslice(-1024, 1024) || window_bytes
      end
    end
    record(errors, restored_bytes == row["original_bytes"], "#{id} restored byte count differs")
    record(errors, restored_digest.hexdigest == row["original_sha256"],
           "#{id} restored SHA-256 differs")
    restored_privacy.each do |finding, present|
      record(errors, !present, "#{id} restored notebook contains #{finding}")
    end
    record(errors, !restored_non_ascii,
           "#{id} restored notebook contains non-ASCII bytes requiring language review")
  rescue Zlib::GzipFile::Error, Zlib::Error, EOFError => e
    errors << "#{id} gzip restoration failed: #{e.message}"
  end
end

trace = load_yaml(File.join(ROOT, "for_ai/trace/exploration_tree.yaml"))
nodes = trace.fetch("nodes")
trace_ids = nodes.map { |n| n.fetch("id") }.to_set
record(errors, trace_ids.length == nodes.length && nodes.length >= 8, "trace IDs are duplicated or too few")
%w[decision pivot dead_end].each do |type|
  record(errors, nodes.any? { |n| n["type"] == type }, "trace lacks #{type} node")
end
nodes.each do |node|
  record(errors, trace.fetch("node_types").include?(node["type"]), "invalid trace type for #{node['id']}")
  [node["parent"], *Array(node["also_depends_on"]), node["superseded_by"]].compact.each do |ref|
    record(errors, trace_ids.include?(ref), "#{node['id']} references unknown trace node #{ref}")
  end
  Array(node["claim_refs"]).each { |ref| record(errors, claim_ids.include?(ref), "unknown trace claim #{ref}") }
  Array(node["experiment_refs"]).each { |ref| record(errors, experiment_ids.include?(ref), "unknown trace experiment #{ref}") }
  Array(node["notebook_refs"]).each { |ref| record(errors, nb_ids.include?(ref), "unknown trace notebook #{ref}") }
  if node["type"] == "dead_end"
    %w[hypothesis failure_mode lesson].each do |field|
      record(errors, !node[field].to_s.empty?, "#{node['id']} dead end lacks #{field}")
    end
  end
end

sessions = load_yaml(File.join(ROOT, "for_ai/trace/sessions/session_index.yaml")).fetch("sessions")
sessions.each do |session|
  Array(session["trace_nodes"]).each { |id| record(errors, trace_ids.include?(id), "session references unknown #{id}") }
  Array(session["outputs"]).each { |id| record(errors, nb_ids.include?(id), "session references unknown #{id}") }
end

summary = load_yaml(File.join(ROOT, "for_ai/evidence/results/verification_summary.yaml"))
summary_counts = summary.fetch("claim_status_counts").reject { |k, _| k == "note" }
record(errors, summary_counts == expected_status, "verification summary claim counts differ")
summary_integrity = summary.fetch("integrity")
record(errors, summary_integrity["repository_notebooks"] == 34 &&
               summary_integrity["direct_notebooks"] == 32 &&
               summary_integrity["compressed_notebooks"] == 2,
       "verification summary notebook inventory differs")

crosswalk_path = File.join(ROOT, "for_ai/logic/notation_crosswalk.yaml")
crosswalk = load_yaml(crosswalk_path)
record(errors, crosswalk["role"] == "manifest", "notation crosswalk role differs")
record(errors, crosswalk.dig("manuscript_snapshot", "sha256") ==
               "6f6b5a7ad6d3b3d364f3eec297315422beaac575388b8e142f29579e44b977de",
       "notation crosswalk manuscript snapshot differs")
record(errors, crosswalk.dig("coordinates", "certificate") == "NB28" &&
               crosswalk.dig("coordinates", "finite_rotation_use") ==
               "chosen_rotation_independent_paper_matched_pullback_not_unique_isotropic_gauge" &&
               crosswalk.dig("coordinates", "manuscript_final", "status") ==
               "manuscript_asserted_coordinate_author_confirmation_required",
       "notation crosswalk coordinate certificate differs")
record(errors, crosswalk.dig("orientation", "certificates") == %w[NB00A NB29],
       "notation crosswalk orientation certificates differ")

pdf_expectations = {
  "for_humans/FINAL_REPORT.pdf" => [35, /version\s+5/i],
  "for_humans/SOLVING_PROCESS.pdf" => [18, /version\s+5/i]
}
pdfinfo_command = ENV.fetch("PDFINFO", `command -v pdfinfo 2>/dev/null`.strip)
pdftotext_command = ENV.fetch("PDFTOTEXT", `command -v pdftotext 2>/dev/null`.strip)
record(errors, !pdfinfo_command.empty?, "required PDF tool missing: pdfinfo")
record(errors, !pdftotext_command.empty?, "required PDF tool missing: pdftotext")
pdf_expectations.each do |rpath, (pages, version_pattern)|
  path = File.join(ROOT, rpath)
  record(errors, File.file?(path) && File.binread(path, 5) == "%PDF-", "invalid PDF signature: #{rpath}")
  next if pdfinfo_command.empty? || pdftotext_command.empty?

  info, info_status = Open3.capture2(pdfinfo_command, path)
  text, text_status = Open3.capture2(pdftotext_command, "-layout", path, "-")
  info = info.b.force_encoding(Encoding::UTF_8).scrub
  text = text.b.force_encoding(Encoding::UTF_8).scrub
  page_count = info[/^Pages:\s+(\d+)/, 1]&.to_i
  record(errors, info_status.success? && page_count == pages, "unexpected PDF page count for #{rpath}")
  record(errors, text_status.success? && text.match?(version_pattern), "PDF does not identify version 5: #{rpath}")
  record(errors, !text.match?(prohibited), "prohibited-script PDF text: #{rpath}")
  1.upto(pages) do |page_number|
    page_text, page_status = Open3.capture2(
      pdftotext_command, "-layout", "-f", page_number.to_s, "-l", page_number.to_s, path, "-"
    )
    page_text = page_text.b.force_encoding(Encoding::UTF_8).scrub
    record(errors, page_status.success? && !page_text.strip.empty?,
           "empty or unreadable PDF page #{page_number}: #{rpath}")
  end
end

manifest_path = File.join(ROOT, "for_ai/evidence/checksums.sha256")
if File.file?(manifest_path)
  manifest_lines = File.readlines(manifest_path, chomp: true).reject(&:empty?)
  parsed = manifest_lines.map { |line| line.match(/\A([0-9a-f]{64})  (.+)\z/)&.captures }
  record(errors, parsed.none?(&:nil?), "invalid checksum manifest line")
  parsed.compact.each do |sha, rpath|
    path = File.join(ROOT, rpath)
    record(errors, File.file?(path), "checksum path missing: #{rpath}")
    record(errors, Digest::SHA256.file(path).hexdigest == sha, "checksum mismatch: #{rpath}") if File.file?(path)
  end
  expected_manifest_files = files.map { |p| rel(p) }.reject { |p| p == "for_ai/evidence/checksums.sha256" }.sort
  record(errors, parsed.compact.map(&:last) == expected_manifest_files, "checksum manifest path set or order differs")
else
  errors << "missing for_ai/evidence/checksums.sha256"
end

if errors.empty?
  puts "ARA_INSPIRED_LEVEL1_PASS"
  puts "claims=22 experiments=22 notebooks=34 direct=32 compressed=2 logs=34 trace_nodes=#{nodes.length}"
  exit 0
end

warn "ARA_INSPIRED_LEVEL1_FAIL (#{errors.length} findings)"
errors.each { |error| warn "- #{error}" }
exit 1
