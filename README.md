# BMPV higher-derivative verification

> **Private author-review draft. Do not distribute, cite, archive publicly, or
> create a public release.**

This repository is a compact research supplement for the first-order
four-derivative correction to the generic three-charge BMPV black hole. It is
organized for two audiences and deliberately does not contain either the
current article source or the historical source paper.

## Choose an entry point

| Audience | Start here | Contents |
|---|---|---|
| Human readers | [`for_humans/README.md`](for_humans/README.md) | The retrospective prompt, chronological research journey, solving-process PDF, and final verification report. |
| AI agents and automated auditors | [`for_ai/PAPER.md`](for_ai/PAPER.md) | An ARA-inspired claim, experiment, source, trace, and evidence graph. |

The main five-dimensional result is generic in the three unequal charges,
first order in the four-derivative coupling, and exact in the single
equal-angular-momentum BMPV rotation parameter within the stated ansatz.
Candidate expressions became claims only after exact Mathematica substitution
and fresh-kernel checks. Human researchers supplied the theory, conventions,
physical interpretation, corrections, and final responsibility.

There was no single magic prompt. The published prompt is explicitly a
retrospective task specification, while the research journey records the
actual sequence of decisions, failures, pivots, and audits that can be
supported by preserved artifacts.

## Artifact boundary

This GitHub view contains 32 executable Mathematica notebooks. The two very
large equation archives, NB01 and NB02, remain outside ordinary Git and are
identified by immutable size and SHA-256 records in
[`for_ai/evidence/external_archive.yaml`](for_ai/evidence/external_archive.yaml).
Their DOI and download URL remain unset until the authors approve a public
archive.

The `for_ai/` directory is inspired by the four-layer Agent-Native Research
Artifact proposal: logic, executable source, exploration trace, and exact
evidence. It is an adaptation for symbolic high-energy theory and is not
presented as a formal third-party ARA certification.

## Current status

- Repository visibility must remain private until the authors approve the
  arXiv and artifact release.
- Publication metadata, DOI, repository URL, and licenses are unresolved.
- No claim of priority or of a first AI-assisted theory paper is made here.
- No existing PASS label is evidence by itself; the linked calculation is.

Run the lightweight structural and cross-reference audit with:

```console
ruby for_ai/validate_level1.rb
```

Full notebook execution requires a compatible licensed Wolfram kernel and is
not part of public continuous integration.
