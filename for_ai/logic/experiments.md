# Verification recipes

These are declarative, blind-friendly procedures. They intentionally omit
reported formulas and exact output values; those belong in
[`../evidence/`](../evidence/README.md). Unless stated otherwise, use exact
arithmetic, a fresh Wolfram kernel, the conventions in `concepts.md`, and the
notebook/log resolver in [`../src/index.md`](../src/index.md).

## EXP-EOM-001 - explicit equations and reductions

- **Verifies:** BMPV-EOM-001
- **Setup:** uncorrected stationary BMPV ansatz and the supplied complete
  four-derivative invariant.
- **Procedure:** inspect all reduced operators and sources; independently check
  correction-field linearity, source purity, Page reductions, and the radial
  constraint.
- **Metrics:** equation count, unknown-field scan, reduction identities.
- **Expected outcome:** every required operator/source and reduction is
  explicit and mutually consistent.
- **Notebooks:** NB01, NB02
- **Failure interpretation:** missing equations or correction fields inside a
  source invalidate the EOM representation.

## EXP-STATIC-001 - generic static substitution

- **Verifies:** BMPV-STATIC-001
- **Setup:** arbitrary unequal charges with rotation set to zero.
- **Procedure:** substitute the static correction into the original thirteen
  equations and simplify symbolically.
- **Metrics:** all independent exact residuals.
- **Expected outcome:** every residual vanishes identically.
- **Notebooks:** NB13
- **Failure interpretation:** any nonzero witness falsifies the generic static
  claim.

## EXP-COORD-001 - two-way radial map

- **Verifies:** BMPV-COORD-001
- **Setup:** generic static solution in both radial gauges.
- **Procedure:** pull every field in both directions using the first-order
  radial diffeomorphism.
- **Metrics:** field-by-field forward and inverse residuals.
- **Expected outcome:** both maps close identically at the retained order.
- **Notebooks:** NB28
- **Failure interpretation:** a nonzero residual rejects the asserted map, not
  merely its interpretation.

## EXP-EQUAL-001 - equal-charge benchmark

- **Verifies:** BMPV-EQUAL-001
- **Setup:** equal charges and unrestricted rotation within the benchmark.
- **Procedure:** construct the closed candidate and substitute it into all
  original reduced equations.
- **Metrics:** thirteen exact residuals.
- **Expected outcome:** every residual vanishes.
- **Notebooks:** NB04, NB05
- **Failure interpretation:** the rotating benchmark is invalid.

## EXP-GENERIC-J1-001 - generic linear rotation

- **Verifies:** BMPV-GENERIC-J1-001
- **Setup:** arbitrary unequal charges; retain the linear odd sector.
- **Procedure:** solve the symbolic block and impose fixed physical Page-charge
  normalization.
- **Metrics:** odd equations and asymptotic charge conditions.
- **Expected outcome:** the block and normalization conditions vanish.
- **Notebooks:** NB06, NB07
- **Failure interpretation:** the generic `j` coefficient or ensemble choice is
  inconsistent.

## EXP-GENERIC-J2-001 - generic quadratic rotation

- **Verifies:** BMPV-GENERIC-J2-001
- **Setup:** arbitrary unequal charges; retain the quadratic even sector.
- **Procedure:** reconstruct a candidate if needed, then substitute it into the
  full symbolic generic-charge system.
- **Metrics:** all even-sector residuals at the selected order.
- **Expected outcome:** arbitrary-charge residuals vanish; sample agreement
  alone is insufficient.
- **Notebooks:** NB08
- **Failure interpretation:** a nonzero symbolic witness rejects the candidate.

## EXP-GENERIC-J3-001 - generic cubic rotation

- **Verifies:** BMPV-GENERIC-J3-001
- **Setup:** arbitrary unequal charges; retain the cubic odd sector.
- **Procedure:** substitute the closed candidate into every symbolic odd
  equation.
- **Metrics:** all odd-sector residuals at the selected order.
- **Expected outcome:** every arbitrary-charge residual vanishes.
- **Notebooks:** NB09
- **Failure interpretation:** the cubic completion is incomplete.

## EXP-EXACT-J-001 - exact rotation closure

- **Verifies:** BMPV-EXACT-J-001
- **Setup:** combined static, linear, quadratic, and cubic correction with
  arbitrary unequal charges.
- **Procedure:** derive the maximum source degree independently and substitute
  into the literal archived EOM; inspect every coefficient through the bound.
- **Metrics:** source-degree audit and all coefficient residuals.
- **Expected outcome:** no allowed higher coefficient survives.
- **Notebooks:** NB10, NB11, NB12
- **Decisive notebook:** NB12
- **Failure interpretation:** an incomplete bound or one nonzero coefficient
  falsifies exactness in rotation.

## EXP-LAMBDA-SUPERPOSITION-001 - STU coupling permutation

- **Verifies:** BMPV-LAMBDA-SUPERPOSITION-001
- **Setup:** three standard-Weyl invariants at first order in their couplings.
- **Procedure:** apply cyclic STU permutations to the verified representative
  and test linear superposition rules.
- **Metrics:** permutation identities and absence of coupling products.
- **Expected outcome:** the representative maps consistently among sectors.
- **Notebooks:** NB16
- **Failure interpretation:** only the directly verified representative may be
  retained.

## EXP-CHARGE-001 - physical normalization

- **Verifies:** BMPV-CHARGE-001
- **Setup:** generic exact-in-rotation correction in the asymptotic frame.
- **Procedure:** reconstruct Page charges, angular momenta, and the reduced
  radial identity at first order.
- **Metrics:** asymptotic surface terms and radial conservation.
- **Expected outcome:** the adopted fixed-charge parameterization is
  preserved.
- **Notebooks:** NB07, NB14, NB17
- **Failure interpretation:** the reported physical dictionary must be changed.

## EXP-HORIZON-001 - positive-gap regularity

- **Verifies:** BMPV-HORIZON-001
- **Setup:** positive charges strictly inside the classical rotation bound.
- **Procedure:** expand the corrected fields and invariant horizon quantities
  on the regular branch.
- **Metrics:** finiteness and allowed denominator signs.
- **Expected outcome:** no first-order singularity occurs in the stated domain.
- **Notebooks:** NB15
- **Failure interpretation:** the regularity scope is too broad.

## EXP-ENTROPY-001 - direct and independent entropy

- **Verifies:** BMPV-ENTROPY-001
- **Setup:** generic solution in the fixed physical Page-charge ensemble.
- **Procedure:** perform the direct Wald--Tachikawa calculation, reconstruct it
  independently without executing the direct notebook, then apply the
  literature convention dictionary.
- **Metrics:** equality of the two exact reconstructions and scoped comparison.
- **Expected outcome:** the independent routes agree in the same ensemble.
- **Notebooks:** NB20, NB21, NB18
- **Independent notebook:** NB21
- **Failure interpretation:** disagreement between independent routes rejects
  the entropy claim; disagreement after changing ensemble does not.

## EXP-F4-SEPARATE-001 - curvature-free vector sources

- **Verifies:** BMPV-F4-SEPARATE-001
- **Setup:** rotating BPS background and the two separate curvature-free vector
  invariants.
- **Procedure:** evaluate each invariant and every relevant first variation.
- **Metrics:** exact source-sector expressions.
- **Expected outcome:** no first-order source survives on this background.
- **Notebooks:** NB03, NB16
- **Failure interpretation:** a surviving variation can induce a correction.

## EXP-F4-ENTROPY-001 - curvature-free vector entropy

- **Verifies:** BMPV-F4-ENTROPY-001
- **Setup:** same background and fixed-charge ensemble as the entropy
  calculation.
- **Procedure:** combine the source test with the direct Riemann-derivative
  criterion for Wald entropy.
- **Metrics:** induced correction and direct entropy derivative.
- **Expected outcome:** neither contribution survives for the two separate
  invariants.
- **Notebooks:** NB03, NB16, NB20
- **Failure interpretation:** restrict or withdraw the no-contribution claim.

## EXP-EPSILON-001 - orientation guards

- **Verifies:** BMPV-EPSILON-001
- **Setup:** oriented orthonormal frame, curved chart, and parity-odd sectors.
- **Procedure:** distinguish symbols, densities, and tensors; reconstruct chart
  orientation and determinant factors; run sign-flip negative controls.
- **Metrics:** convention identities and guard behavior.
- **Expected outcome:** the physical convention passes and deliberately
  flipped variants fail.
- **Notebooks:** NB00A, NB29
- **Failure interpretation:** parity-odd claims require re-audit.

## EXP-V1-SIGN-001 - retrospective parity-odd audit

- **Verifies:** BMPV-V1-SIGN-001
- **Setup:** archived v1 implementation under the explicit convention
  dictionary.
- **Procedure:** map its alternating density and curved tensor factors to the
  physical orientation field by field.
- **Metrics:** sign compatibility of certified observables.
- **Expected outcome:** under-documentation is separated from an actual sign
  reversal.
- **Notebooks:** NB29
- **Failure interpretation:** only observables with a demonstrated mismatch
  may be reversed.

## EXP-MAP-SCALAR-001 - generic rotating scalar map

- **Verifies:** MAP-SCALAR-001
- **Setup:** arbitrary unequal charges, rotation, and radius on the stationary
  solution space.
- **Procedure:** keep all parameters symbolic and evaluate the map residual.
- **Metrics:** generic scalar identity.
- **Expected outcome:** the residual vanishes without charge specialization.
- **Notebooks:** NB30
- **Failure interpretation:** finite samples cannot rescue the generic claim.

## EXP-MAP-RAW-DUAL-001 - raw duality and closure

- **Verifies:** MAP-RAW-DUAL-001
- **Setup:** arbitrary radial profiles in the stated rotating ansatz.
- **Procedure:** reconstruct the physical minus-duality relation and apply the
  exterior derivative independently.
- **Metrics:** duality and Bianchi residuals.
- **Expected outcome:** both identities hold for arbitrary profiles.
- **Notebooks:** NB31
- **Failure interpretation:** the raw potential cannot anchor the final map.

## EXP-MAP-C3-SOLUTION-001 - exact third-vector target map

- **Verifies:** MAP-C3-SOLUTION-001
- **Setup:** generic unequal-charge exact rotating solution.
- **Procedure:** apply the closed shift, postdual redefinition, and radial
  pullback, then compare every potential component and Bianchi identity.
- **Metrics:** generic component and closure residuals.
- **Expected outcome:** the target is reproduced on the stated solution space.
- **Notebooks:** NB31
- **Failure interpretation:** the scoped target identity fails; it says nothing
  by itself about a universal off-shell map.

## EXP-MAP-C3-THREEFORM-ROUTE-001 - rejected endpoint

- **Verifies:** MAP-C3-THREEFORM-ROUTE-001
- **Setup:** the historical assembled three-form-first endpoint.
- **Procedure:** compute its generic-rotation closure and rank witnesses.
- **Metrics:** preserved nonclosure witness and repair consistency.
- **Expected outcome:** the route fails its closure requirement.
- **Notebooks:** NB27
- **Outcome class:** `rejected_route`
- **Failure interpretation:** if the witness vanished, the historical route
  would need reclassification and independent target testing.

## EXP-MAP-SOURCE-NOGO-001 - displayed-source sufficiency

- **Verifies:** MAP-SOURCE-NOGO-001
- **Setup:** displayed Appendix-B currents and the other tested source
  directions in the stationary ansatz.
- **Procedure:** impose closure, parity, static vanishing, and falloff and
  compute the remaining coefficient rank.
- **Metrics:** exact rank and ambiguity dimension.
- **Expected outcome:** the displayed structures do not uniquely determine the
  target shift.
- **Notebooks:** NB32
- **Outcome class:** `insufficiency/nonuniqueness`
- **Failure interpretation:** never generalize this experiment into a universal
  covariant no-go theorem.

## EXP-MAP-OFFSHELL-001 - universal off-shell boundary

- **Verifies:** MAP-OFFSHELL-001
- **Setup:** requirements for a map valid beyond the stationary solution space.
- **Procedure:** test whether the preserved source data provide a unique
  covariant derivation rather than a target-matched on-solution identity.
- **Metrics:** uniqueness and independence from the target solution.
- **Expected outcome:** uniqueness is not established by the available data.
- **Notebooks:** NB32
- **Outcome class:** `open_limit`
- **Failure interpretation:** promote the claim only after a new independent
  off-shell derivation is supplied and audited.
