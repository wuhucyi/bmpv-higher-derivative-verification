# Claim ledger

Global scope: five-dimensional STU supergravity with one complete
supersymmetric four-derivative invariant of coupling `lambda3`; first order in
that coupling; exact in `j` unless a narrower rotation order is stated.

Status values are `established`, `established_with_scope`, `rejected_route`,
and `not_established`. Notebook IDs resolve through
[`../src/index.md`](../src/index.md); experiment IDs resolve through
[`experiments.md`](experiments.md).

## BMPV-EOM-001

- **Statement:** The correction problem is represented by thirteen explicit
  linearized two-derivative operators plus thirteen explicit four-derivative
  sources evaluated on the uncorrected BMPV background.
- **Status:** `established`
- **Scope:** stationary equal-angular-momentum ansatz at `O(lambda3)`.
- **Falsification:** any source contains an unknown correction field, or an
  independent reduced equation is missing.
- **Proof:** EXP-EOM-001; NB01, NB02.
- **Caveat:** NB00 is a resource-bounded derivation scaffold, not a complete
  executed regeneration certificate.
- **Tags:** equations, source, archive.

## BMPV-STATIC-001

- **Statement:** The generic unequal-charge static correction solves all
  thirteen equations symbolically.
- **Status:** `established`
- **Scope:** arbitrary positive `mu_I`; `O(lambda3)`; `j=0`.
- **Falsification:** any exact arbitrary-charge residual is nonzero.
- **Proof:** EXP-STATIC-001; NB13.
- **Tags:** static, unequal-charge, symbolic.

## BMPV-COORD-001

- **Statement:** The generic static solution in the harmonic/isotropic-like
  paper radius and the areal proof gauge are related by an exact first-order
  two-way radial diffeomorphism.
- **Status:** `established_with_scope`
- **Scope:** `O(lambda3)`; arbitrary unequal charges.
- **Falsification:** either pullback fails for any certified field.
- **Proof:** EXP-COORD-001; NB28.
- **Caveat:** the same `j`-independent pullback at rotation defines a
  paper-matched coordinate, not a uniquely fixed fully isotropic rotating
  gauge.
- **Tags:** coordinates, gauge, static.

## BMPV-EQUAL-001

- **Statement:** The equal-charge rotating closed-form correction passes
  direct substitution in all thirteen equations.
- **Status:** `established`
- **Scope:** equal charges; `O(lambda3)`; exact rotation dependence represented
  by the benchmark.
- **Falsification:** any original reduced equation has a nonzero residual.
- **Proof:** EXP-EQUAL-001; NB04, NB05.
- **Tags:** benchmark, equal-charge, rotation.

## BMPV-GENERIC-J1-001

- **Statement:** The generic unequal-charge correction linear in `j` is solved
  symbolically and normalized at fixed physical charges.
- **Status:** `established`
- **Scope:** arbitrary unequal charges; `O(lambda3 j)`.
- **Falsification:** a symbolic odd-sector residual or fixed-charge condition
  fails.
- **Proof:** EXP-GENERIC-J1-001; NB06, NB07.
- **Tags:** unequal-charge, slow-rotation, charge.

## BMPV-GENERIC-J2-001

- **Statement:** The generic unequal-charge parity-even correction through
  `j^2` is solved symbolically.
- **Status:** `established`
- **Scope:** arbitrary unequal charges; `O(lambda3 j^2)`.
- **Falsification:** any generic parity-even reduced residual is nonzero.
- **Proof:** EXP-GENERIC-J2-001; NB08.
- **Tags:** unequal-charge, even, reconstruction.

## BMPV-GENERIC-J3-001

- **Statement:** The generic unequal-charge parity-odd correction through
  `j^3` is solved symbolically.
- **Status:** `established`
- **Scope:** arbitrary unequal charges; `O(lambda3 j^3)`.
- **Falsification:** any generic parity-odd reduced residual is nonzero.
- **Proof:** EXP-GENERIC-J3-001; NB09.
- **Tags:** unequal-charge, odd, reconstruction.

## BMPV-EXACT-J-001

- **Statement:** The generic unequal-charge five-dimensional correction is
  exact in `j` at first order in `lambda3`: parity-even corrections terminate
  at `j^2`, parity-odd corrections terminate at `j^3`, and every allowed
  higher residual coefficient through the maximum source degree `j^8`
  vanishes.
- **Status:** `established`
- **Scope:** stationary equal-angular-momentum BMPV ansatz; arbitrary unequal
  charges; `O(lambda3)`.
- **Falsification:** the source-degree bound is incomplete or any exact
  residual coefficient through that bound is nonzero.
- **Proof:** EXP-EXACT-J-001; NB10, NB11, decisive NB12.
- **Dependencies:** BMPV-EOM-001, BMPV-GENERIC-J1-001,
  BMPV-GENERIC-J2-001, BMPV-GENERIC-J3-001.
- **Tags:** exact-rotation, decisive, from-EOM.

## BMPV-LAMBDA-SUPERPOSITION-001

- **Statement:** At first order in the four-derivative couplings, the
  correction for general standard-Weyl STU couplings `lambda_I` is obtained by
  cyclically permuting the `lambda3` correction and adding the three
  contributions.
- **Status:** `established_with_scope`
- **Scope:** three standard-Weyl invariants related by STU permutation
  symmetry; `O(lambda_I)`; no quadratic coupling products.
- **Falsification:** cyclic permutation fails to map the representative
  invariant and background sectors into one another.
- **Proof:** EXP-LAMBDA-SUPERPOSITION-001; NB16.
- **Dependencies:** BMPV-EXACT-J-001.
- **Caveat:** the artifact directly verifies the `lambda3` representative; it
  does not contain a separate combined-coupling thirteen-equation run.
- **Tags:** STU symmetry, superposition, scoped.

## BMPV-CHARGE-001

- **Statement:** The corrected solution preserves
  `Q_I = pi mu_I/(4 G_5)` and has `J_1 = J_2 = pi j/(4 G_5)` in the adopted
  fixed-charge normalization.
- **Status:** `established`
- **Scope:** `O(lambda3)`; generic unequal charges; exact in `j`.
- **Falsification:** an asymptotic Page or angular-momentum surface term changes
  either relation.
- **Proof:** EXP-CHARGE-001; NB07, NB14, NB17.
- **Tags:** Page charge, angular momentum, normalization.

## BMPV-HORIZON-001

- **Statement:** The corrected solution is regular on the positive-gap branch.
- **Status:** `established_with_scope`
- **Scope:** `mu_I>0` and `j^2 < mu_1 mu_2 mu_3`; `O(lambda3)`.
- **Falsification:** a gauge-invariant first-order horizon quantity diverges in
  this domain.
- **Proof:** EXP-HORIZON-001; NB15.
- **Caveat:** no perturbative regularity claim is made at the classical
  zero-area endpoint.
- **Tags:** horizon, regularity, branch.

## BMPV-ENTROPY-001

- **Statement:** With `P=mu_1 mu_2 mu_3`, the direct Wald--Tachikawa entropy is
  `S = [pi^2/(2 G_5)] sqrt(P-j^2) [1 + 4 lambda3
  (3P-4j^2)/(mu_3(P-j^2))] + O(lambda3^2)`.
- **Status:** `established_with_scope`
- **Scope:** fixed physical charges; `j^2<P`; exact in `j` at `O(lambda3)`.
- **Falsification:** either direct reconstruction, including the relevant
  Chern--Simons contribution, gives a different exact expression in the same
  ensemble.
- **Proof:** EXP-ENTROPY-001; NB20, independent NB21, comparison NB18.
- **Tags:** entropy, Wald--Tachikawa, ensemble.

## BMPV-F4-SEPARATE-001

- **Statement:** Both independent curvature-free vector invariants, including
  their `F^4` terms, and the first variations entering their field equations
  vanish on the rotating BPS background, so they do not correct the solution
  at first order.
- **Status:** `established_with_scope`
- **Scope:** the two curvature-free vector invariants on the stationary
  rotating BPS background; exact in `j`.
- **Falsification:** an invariant or relevant first variation is nonzero on the
  stated background.
- **Proof:** EXP-F4-SEPARATE-001; NB03, NB16.
- **Caveat:** vector completion terms in the active supersymmetric
  curvature-squared invariant remain part of the equations.
- **Tags:** vector invariant, F4, source.

## BMPV-F4-ENTROPY-001

- **Statement:** The two curvature-free vector invariants do not change the
  first-order BMPV entropy: their sources induce no solution correction and,
  because they contain no curvature tensor, they have no direct Wald
  derivative with respect to the Riemann tensor.
- **Status:** `established_with_scope`
- **Scope:** the same rotating BPS background and fixed-charge ensemble; first
  order in the two vector-invariant couplings.
- **Falsification:** either an induced correction or direct Riemann derivative
  contributes in the stated setup.
- **Proof:** EXP-F4-ENTROPY-001; NB03, NB16, NB20.
- **Dependencies:** BMPV-F4-SEPARATE-001, BMPV-ENTROPY-001.
- **Caveat:** this does not concern vector-field completion terms inside a
  standard-Weyl invariant.
- **Tags:** entropy, vector invariant, scoped.

## BMPV-EPSILON-001

- **Statement:** The archived parity-odd implementation uses the flat symbol,
  curved tensor, and alternating density consistently with the physical
  orientation.
- **Status:** `established`
- **Scope:** AFF, epsilon-FFF-dX, ARR, and mixed-curvature sectors.
- **Falsification:** determinant factors or chart orientation fail an
  executable guard.
- **Proof:** EXP-EPSILON-001; NB00A, NB29.
- **Tags:** convention, Levi-Civita, parity odd.

## BMPV-V1-SIGN-001

- **Statement:** Version 1 was under-documented but is not sign-flipped; no
  archived metric, vector, Page-charge, or angular-momentum result requires
  reversal.
- **Status:** `established_with_scope`
- **Scope:** sealed-v1 parity-odd implementation under the corrected convention
  dictionary.
- **Falsification:** the archived determinant and density implementation maps
  to the opposite physical orientation.
- **Proof:** EXP-V1-SIGN-001; NB29.
- **Dependencies:** BMPV-EPSILON-001.
- **Tags:** retrospective audit, sign, v1.

## MAP-SCALAR-001

- **Statement:** The rotating scalar map is a symbolic identity for arbitrary
  unequal charges and rotation.
- **Status:** `established`
- **Scope:** stationary BMPV solution space; `O(alphaPrime)`; exact in
  rotation.
- **Falsification:** the generic symbolic scalar residual is nonzero.
- **Proof:** EXP-MAP-SCALAR-001; NB30.
- **Tags:** field map, scalar, symbolic.

## MAP-RAW-DUAL-001

- **Statement:** The raw third-vector potential obeys the physical minus-duality
  relation for arbitrary radial profiles, and its field strength is closed.
- **Status:** `established`
- **Scope:** arbitrary radial `Z_0`, `Z_+`, `Z_-`, and `W` in the stated ansatz
  and orientation.
- **Falsification:** the duality or Bianchi residual is nonzero.
- **Proof:** EXP-MAP-RAW-DUAL-001; NB31.
- **Tags:** duality, arbitrary profiles, closure.

## MAP-C3-SOLUTION-001

- **Statement:** A closed target-determined shift, followed by the certified
  postdual redefinition and radial pullback, reproduces the exact
  five-dimensional third vector with zero generic component and Bianchi
  residuals.
- **Status:** `established_with_scope`
- **Scope:** stationary generic unequal-charge BMPV solution space;
  `O(alphaPrime)`; exact in rotation.
- **Falsification:** any generic potential component or Bianchi residual is
  nonzero.
- **Proof:** EXP-MAP-C3-SOLUTION-001; NB31.
- **Dependencies:** MAP-RAW-DUAL-001, MAP-SCALAR-001, BMPV-EXACT-J-001.
- **Caveat:** shift coefficients are fixed by the independently EOM-certified
  five-dimensional target and recognized in source profiles; they are not
  independently source-derived.
- **Tags:** third vector, solution space, scoped.

## MAP-C3-THREEFORM-ROUTE-001

- **Statement:** The historical three-form-first endpoint is nonclosed at
  generic rotation and cannot define the physical final third vector.
- **Status:** `rejected_route`
- **Scope:** the specific assembled intermediate object tested in NB27.
- **Falsification:** the preserved generic closure witness vanishes without
  changing the tested construction.
- **Proof:** EXP-MAP-C3-THREEFORM-ROUTE-001; NB27.
- **Superseded by:** MAP-C3-SOLUTION-001.
- **Tags:** rejected route, nonclosure, negative control.

## MAP-SOURCE-NOGO-001

- **Statement:** The displayed Appendix-B currents and other tested displayed
  source directions do not determine the required third-vector shift;
  closure, parity, static vanishing, and falloff leave a two-parameter
  ambiguity.
- **Status:** `established_with_scope`
- **Scope:** displayed source structures and the stationary BMPV ansatz.
- **Falsification:** those structures uniquely determine both shift
  coefficients under the stated constraints.
- **Proof:** EXP-MAP-SOURCE-NOGO-001; NB32.
- **Caveat:** this is an insufficiency/nonuniqueness result, not a no-go theorem
  for every possible covariant field redefinition.
- **Tags:** source, underdetermination, limitation.

## MAP-OFFSHELL-001

- **Statement:** A unique manifestly covariant off-shell heterotic-to-STU
  third-vector field redefinition valid on unrelated backgrounds has not been
  derived.
- **Status:** `not_established`
- **Scope:** universal off-shell map beyond the stationary BMPV solution space.
- **Falsification:** a complete independent covariant derivation satisfying
  the stated theory and convention constraints is supplied.
- **Proof:** EXP-MAP-OFFSHELL-001; NB32 records the present boundary.
- **Resolution needed:** an unreduced-to-dual parent functional with all
  EOM/boundary generators, an explicit covariant third-vector redefinition, or
  an independent dualized supersymmetry derivation.
- **Tags:** open question, off shell, field redefinition.
