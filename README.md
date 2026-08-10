# BMPV higher-derivative solution: research supplement

> **Private review draft — do not distribute, cite, archive publicly, or enable a public GitHub release.**

This repository is a proposed supplement to *BMPV black holes in higher-derivative supergravity*. It connects the current manuscript, the human-verification report, the computational record, and claim-level evidence. It is intended for discussion among the authors before any arXiv or public release.

All repository-facing prose, filenames, notebook comments, notebook metadata, and validation records are maintained in English. Mathematical notation, bibliographic names, and standard scientific symbols are not treated as prose.

The main result is a generic unequal-charge BMPV solution that is first order in the four-derivative couplings and exact in the rotation parameter. Candidate expressions generated during an AI-assisted workflow were accepted only after exact Mathematica substitution and independent fresh-kernel checks. The human authors remain responsible for every scientific claim.

## Start here

- Readers: [`paper/current_manuscript/main.tex`](paper/current_manuscript/main.tex), then [`human/verification_report/main_new.pdf`](human/verification_report/main_new.pdf).
- Reproducers: [`human/solving_process/solving_process.pdf`](human/solving_process/solving_process.pdf), then the machine-readable claim and evidence indexes.
- AI agents: [`PAPER.md`](PAPER.md), then [`AGENTS.md`](AGENTS.md).
- Archivists: [`archive/ARCHIVING.md`](archive/ARCHIVING.md) and [`archive/CONTENT_PLAN.md`](archive/CONTENT_PLAN.md).

## Repository map

| Path | Role |
|---|---|
| `paper/current_manuscript/` | Current article downloaded from the authors' Overleaf project. This is the publication manuscript. |
| `paper/historical_paper_original/` | Earlier STU/Gutowski--Reall source paper used as the historical starting point. It is **not** the current manuscript. |
| `human/` | Version-5 verification report, chronological solving narrative, and compact package guide. |
| `logic/` | Machine-readable conventions, claims, dependencies, and limitations. |
| `machine/` | Notebook index, execution environment, and verification tiers. |
| `src/notebooks/` | The 32 GitHub-sized Mathematica notebooks; notebooks 01 and 02 remain archive-only. |
| `evidence/` | Sanitized GitHub copies of fresh-kernel logs and independent audit records. |
| `provenance/` | Historical milestones, human interventions, model/tool metadata, and redaction policy. |
| `reproduction/` | Retrospective reconstruction and independent-audit prompts, including a blind protocol. |
| `archive/` | Instructions and placeholders for the separately preserved complete archive. |

The full sealed verification package is not committed here: it is about 686 MiB, and its largest Mathematica notebook is about 597 MiB. The eventual public repository should point to an immutable DOI-bearing archive containing those files.

## Current status

- Private author review only.
- Publication metadata, DOI, repository URL, licenses, and final artifact version are unresolved placeholders.
- No statement of priority or “first use” is made by this repository.
- The email block already present in the manuscript must be approved by all authors before public release.
- The current manuscript source is included, but no compiled current-manuscript PDF was present in the downloaded Overleaf tree.

See [`LICENSE_STATUS.md`](LICENSE_STATUS.md), [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md), and [`PUBLIC_RELEASE_CHECKLIST.md`](PUBLIC_RELEASE_CHECKLIST.md) before changing repository visibility.

For the lightweight structural, privacy, size, and claim-binding audit, run

```console
ruby tools/validate_repo.rb
```

The same check is configured for pull requests. Full Mathematica evaluation
remains a documented licensed-kernel workflow rather than a public CI job.
`REPOSITORY_CHECKSUMS.sha256` seals every review-repository file other than
the manifest itself; it is separate from the immutable full-v5 archive seal.
