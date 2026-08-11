# Agent operating instructions

Read [`README.md`](README.md) first. Treat this repository as a linked research
artifact, not as a narrative paper or a collection of trustworthy PASS labels.

1. Load conventions from [`logic/concepts.md`](logic/concepts.md) before
   interpreting any parity-odd expression.
2. Resolve a claim through `claims.md -> experiments.md -> src/index.md ->
   evidence/`; do not skip a layer.
3. Use exact arithmetic. Samples are discovery or falsification evidence only.
4. Start each decisive notebook in a fresh Wolfram kernel and retain literal
   residuals, messages, environment information, and hashes.
5. Never silently convert a rejected route, scoped result, or unresolved
   question into an established claim.
6. NB12 is the decisive from-EOM exact-in-rotation verifier. NB21 is the
   independent entropy reconstruction. NB27 is a rejected route. NB32 proves
   source insufficiency, not a universal no-go theorem.
7. NB01 and NB02 are archive-only. Verify their byte counts and SHA-256 values
   before using them; do not substitute a similarly named local file.
8. Do not expose private correspondence, absolute local paths, credentials,
   hidden model reasoning, or unsupported reconstructed model settings.

Run `ruby validate_level1.rb` from this directory or
`ruby for_ai/validate_level1.rb` from the repository root before proposing a
change.
