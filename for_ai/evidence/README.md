# Exact evidence

This directory contains reported outputs and integrity records. Verification
procedures and directional expectations live in
[`../logic/experiments.md`](../logic/experiments.md); they deliberately do not
contain the reported values recorded here.

## Proof-chain resolution

1. Select a claim in [`../logic/claims.md`](../logic/claims.md).
2. Follow its `EXP-*` identifier to the verification recipe.
3. Resolve every `NB*` identifier through [`../src/index.md`](../src/index.md).
4. Resolve the exact assigned log in [`logs/`](logs/).
5. Verify the notebook hash against [`checksums.sha256`](checksums.sha256).
6. Treat archive-only NB01/NB02 as usable only after matching the immutable
   metadata in [`external_archive.yaml`](external_archive.yaml).

There are exactly 34 canonical logs: one for each NB ID, including the two
archive-only notebooks. The stale pre-sanitization NB00 log is not part of this
artifact. Each canonical log records the kernel, notebook identity, literal
terminal predicate, and sequential-evaluation end marker.

[`results/verification_summary.yaml`](results/verification_summary.yaml)
contains a compact exact ledger. [`final_audit.md`](final_audit.md) is generated
only after the two-audience tree has passed an independent audit. Neither file
replaces the notebook calculation.
