# Audit record

## Scientific audit history

The version-5 scientific package was not accepted on its first release-audit
round. That round identified an incorrect description of the displayed source
terms, stale manifests, and a premature provenance statement. The package was
corrected and audited again. The terminal v5 checks independently reran the
generic rotating scalar proof, raw-potential-first third-vector map, and
displayed-source underdetermination certificate. The resulting claim boundary
is preserved here:

- the generic five-dimensional solution is established at first order in the
  higher-derivative coupling and exact in rotation within the stationary
  equal-angular-momentum ansatz;
- the rotating scalar and third-vector maps are exact on the BMPV solution
  space;
- the displayed source structures leave a two-parameter ambiguity;
- a unique universal off-shell field redefinition remains not established.

## Two-audience migration self-audit

The compact migration was initially performed without modifying the two
retained PDFs, the 32 directly stored notebooks, or the 34 canonical logs:

- the 32 directly stored notebooks were Git-blob identical to the
  pre-migration `src/notebooks` objects;
- the 34 canonical logs were Git-blob identical to the pre-migration
  validation records;
- the retained PDFs were Git-blob identical to the version-5 report and
  solving-process objects;
- the final report contains 35 nonempty A4 pages;
- the solving-process document contains 18 nonempty A4 pages.

A later presentation-only revision removed language implying that an external
STU notebook collection is a required input, identified the supplementary
document author as GPT 5.6 Sol, and left the scientific formulas and claim
scope unchanged. The three notebooks whose explanatory text was clarified
were rerun from fresh Mathematica 14.1 kernels; their exact PASS verdicts and
current hashes are recorded in the canonical logs. Current artifact identities
are bound by `checksums.sha256`.

All 53 pages were rendered after the presentation revision. Contact-sheet
inspection and full-resolution spot checks found no clipping, overlap, missing
glyphs, or unreadable page. Every page has extractable text.

The new cross-reference layer contains 22 preserved scientific claims, 22
verification recipes, 34 NB identifiers, 34 assigned logs, and 13 evidenced
trace nodes. NB27 remains a rejected route, NB32 remains a scoped
underdetermination result, and MAP-OFFSHELL-001 remains not established.

## Independent migration audit

Two agents audited the frozen candidate independently of the construction
pass. The scientific-preservation audit found no discrepancy across the 22
claims, their statuses, scopes, dependencies, notebook evidence, field-map
boundary, or retained formulas. It confirmed that deleting the paper sources
and superseded audit rounds did not remove an essential result: the detailed
formulas remain in the final report and byte-identical executable notebooks.

The repository acceptance audit initially failed. It found that the first
validator revision could skip PDF text checks when `pdftotext` was missing and
could mishandle extracted text under a US-ASCII locale. This was classified as
a P1 fail-open validation defect. The validator was repaired to:

- require both `pdfinfo` and `pdftotext`;
- fail when either dependency is absent;
- force captured output to UTF-8 and scrub invalid byte sequences; and
- test every one of the 53 PDF pages for nonempty extractable text.

The same auditor then reran positive and negative controls. The full validator
passed with the PDF tools available; it failed as intended with either tool
absent; the ASCII-locale crash did not recur. It also independently confirmed
the checksum path set, notebook/log/PDF blob identity, English/privacy scan,
root allowlist, forbidden-extension scan, and all claim, experiment, source,
trace, and evidence references.

## Terminal migration verdict

**PASS.** No unresolved migration-audit finding remained in the compact
two-audience migration. Subsequent repository revisions carry their own
checksum validation and independent audit records in Git history.
