---
title: Verification artifact for the four-derivative BMPV solution
authors:
  - Yide Cai
  - Sabarenath Jayaprakash
  - James T. Liu
  - Yi Pang
  - Robert J. Saskowski
year: 2026
venue: private author review
doi: null
domain: symbolic high-energy theory
src_mode: kernel
keywords: [BMPV, STU supergravity, higher derivatives, symbolic verification]
claims_summary: 22
abstract: >-
  A machine-operable record for the generic unequal-charge BMPV correction at
  first order in the four-derivative coupling and exact in the single
  equal-angular-momentum rotation parameter within the stated ansatz.
---

# Machine entry point

This is an **ARA-inspired** symbolic-physics artifact, not a formal third-party
ARA certification. It follows progressive disclosure across four layers:

| Layer | Entry | Purpose |
|---|---|---|
| Logic | [`logic/problem.md`](logic/problem.md) | Scope, concepts, claims, verification recipes, and limitations. |
| Source | [`src/index.md`](src/index.md) | The 32 repository notebooks and two hash-addressed archive objects. |
| Trace | [`trace/exploration_tree.yaml`](trace/exploration_tree.yaml) | Evinced decisions, pivots, experiments, and dead ends. |
| Evidence | [`evidence/README.md`](evidence/README.md) | Exact fresh-kernel records, result ledger, audit, and checksums. |

Start with [`logic/concepts.md`](logic/concepts.md), then
[`logic/claims.md`](logic/claims.md) and
[`logic/experiments.md`](logic/experiments.md). A claim is supported only when
its experiment, notebook, and evidence references all resolve. Numerical
samples may falsify but never certify a generic unequal-charge identity.

Mandatory scope: first order in `lambda3`; equal angular momenta; positive-gap
regular branch; fixed physical Page-charge ensemble; exact in rotation only
within the stationary BMPV ansatz. Solution-space field-map identities must
not be promoted to universal off-shell field redefinitions.

The retrospective reproduction prompt lives in
[`../for_humans/PROMPT.md`](../for_humans/PROMPT.md). It is not a verbatim
historical prompt. The chronological human account lives in
[`../for_humans/RESEARCH_JOURNEY.md`](../for_humans/RESEARCH_JOURNEY.md).
