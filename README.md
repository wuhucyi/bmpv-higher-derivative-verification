# Supplementary materials for the four-derivative BMPV solution

This repository contains the supplementary calculation and verification
materials for the first-order four-derivative correction to the generic
three-charge BMPV black hole. It provides complementary reading paths for
human researchers and AI-assisted or automated verification.

## Choose an entry point

| Audience | Start here | Contents |
|---|---|---|
| Human readers | [`for_humans/README.md`](for_humans/README.md) | The notation crosswalk, retrospective prompt, chronological research journey, solving-process PDF, and final verification report. |
| AI agents and automated auditors | [`for_ai/README.md`](for_ai/README.md) | Machine-oriented navigation through the claim, experiment, source, trace, and evidence graph. |

The main five-dimensional result is generic in the three unequal charges,
first order in the four-derivative coupling, and exact in the single
equal-angular-momentum BMPV rotation parameter within the stated ansatz.
Candidate expressions became claims only after exact Mathematica substitution
and fresh-kernel checks. Human researchers supplied the theory, conventions,
physical interpretation, corrections, and final responsibility.

The published prompt is a retrospective task specification. The research
journey records the sequence of decisions, failures, pivots, and audits
supported by the preserved artifacts.

## Included materials

This repository contains all 34 Mathematica notebooks. NB01 and NB02 are
stored as losslessly compressed `.nb.gz` files because their uncompressed
forms are unusually large. Their compressed and uncompressed sizes and
SHA-256 values are recorded in
[`for_ai/evidence/notebook_archives.yaml`](for_ai/evidence/notebook_archives.yaml).
All other notebooks are stored directly as `.nb` files.

The `for_ai/` directory uses an Agent-Native Research Artifact-inspired
four-layer organization: logic, executable source, exploration trace, and
exact evidence, adapted for symbolic high-energy theory.

## Verification

Each claim links to its verification procedure and exact evidence; a recorded
PASS label is not a substitute for the linked calculation. Reuse and
redistribution are governed by [`RIGHTS_AND_REUSE.md`](RIGHTS_AND_REUSE.md).

Run the lightweight structural and cross-reference audit with:

```console
ruby for_ai/validate_level1.rb
```

Continuous integration runs this structural audit. Reproducing the full
notebook calculations additionally requires a compatible licensed Wolfram
kernel.
