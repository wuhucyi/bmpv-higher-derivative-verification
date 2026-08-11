# Independent audit prompt

> **Status:** Retrospective audit specification.  The auditor must be
> independent of the derivation context and must not treat existing PASS
> labels, prose claims or numerical samples as proof.

```text
Audit the supplied five-dimensional four-derivative BMPV/STU calculation.
Your task is to try to falsify the claimed result, not to improve its prose or
to reproduce its existing PASS labels.

INDEPENDENCE RULES
1. Begin in a fresh Mathematica kernel and record the exact environment that
   is observable.  Do not execute initialization files outside the package.
2. Read the action, ansatz and convention ledger before the claimed solution.
3. Reconstruct the decisive residuals from the archived equations and sources.
   Do not define a residual by copying its expected value or final predicate.
4. Treat every imported expression and cached notebook output as untrusted.
5. Use exact arithmetic.  Parameter samples may expose a failure but cannot
   certify a generic identity.

MANDATORY CHECKS
A. Verify the flat-frame and curved-tensor Levi-Civita conventions, chart
   orientation, determinant factors, gauge-potential sign, Hodge-star square,
   and parity-odd action coefficients.
B. Verify that the uncorrected fields solve the two-derivative equations and
   that the correction equations are linear in the unknown first-order fields.
C. Confirm that each four-derivative source is evaluated only on the
   uncorrected background and contains no unknown correction function.
D. Recompute the Page first integrals and radial constraint and test their
   consistency with the full reduced equations.
E. Substitute the generic static solution into the original equations and
   verify every independent residual symbolically.
F. Substitute the combined rotating solution into the original equations.
   Determine the maximum possible rotation degree independently and verify all
   coefficients through that degree for arbitrary unequal charges.
G. Recompute the normalization of physical charges and angular momentum,
   asymptotic frame, horizon regularity and perturbative domain.
H. Independently reconstruct the Wald--Tachikawa entropy, including normal-
   bundle and mixed Chern--Simons terms, and distinguish fixed physical charge
   from fixed solution parameters.
I. Verify the static two-way radial coordinate transformation field by field.
   Check that the rotating pullback is not overstated as a unique isotropic
   gauge.
J. Audit each ten-to-five-dimensional field-map claim at its stated logical
   strength.  In particular, separate generic off-shell identities,
   arbitrary-profile identities, identities restricted to the exact rotating
   solution, and unresolved universal source origins.
K. Check that the report, notebook index, claim ledger, logs and checksum
   manifest refer to the same formulas and files.

NEGATIVE CONTROLS
- Flip the orientation or gauge-potential sign and verify that at least one
  designated guard fails.
- Perturb one correction coefficient and verify that a decisive EOM residual
  becomes nonzero.
- Replace a generic charge identity by several rational samples and confirm
  that the audit does not promote it to symbolic proof.
- Test the rejected three-form-first field-map route and retain its nonzero
  closure witness.

OUTPUT
For each claim, report: PASS, FAIL, CONDITIONAL or NOT TESTED; the exact
expression tested; its assumptions; the independent evidence location; and a
minimal nonzero witness for every failure.  Classify findings by scientific
severity.  A final PASS is permitted only when it is computed from the listed
checks, not manually assigned.  Preserve the full failure report if the
artifact is repaired and audited again.
```

## Unblinding protocol

For the strongest test, give the auditor the action, background, equations and
claim statements but initially withhold the target correction fields and
expected outputs.  Timestamp and hash its reconstruction before comparison
with the released solution.  Run the ordinary artifact audit separately; the
two tests answer different questions.

