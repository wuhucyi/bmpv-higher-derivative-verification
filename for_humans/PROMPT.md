# Canonical reproduction prompt

> **Status:** Retrospective task specification.  This prompt was composed after
> the calculation and is not a verbatim historical prompt.  It is intended to
> make the research protocol reproducible, not to imply that one prompt
> originally produced the result.

```text
You are assisting with a symbolic calculation in five-dimensional
supergravity.  Work only from the supplied action, two-derivative rotating
STU/BMPV solution, convention ledger, references, and historical static
notebooks.  Treat every imported formula as convention-dependent until it is
checked.

OBJECTIVE
Derive and independently verify the correction that is first order in the
specified four-derivative coupling, generic in the three unequal charges, and
exact in the rotation parameter.  Produce an explicit, self-contained
Mathematica verification chain and a chronological human-readable account.

FIXED CONVENTIONS
- Use the supplied metric signature, curvature convention and action
  normalization without silent conversion.
- In the oriented orthonormal frame, the flat Levi-Civita symbol satisfies
  epsilon_(01234)=+1 and epsilon^(01234)=-1.
- Construct curved Levi-Civita tensors with the appropriate vielbeins and
  metric-determinant factor; do not identify them with the alternating symbol.
- Use the positive gauge-potential sign specified by the supplied BMPV
  background.
- Keep the higher-derivative expansion parameter distinct from the rotation
  parameter and retain only first order in the former.

DERIVATION
1. State the ansatz, radial gauge, correction fields and boundary conditions.
2. Derive every reduced radial equation in the form

       E2_linear[delta fields] + E4_source[background] = 0.

   Make the homogeneous operator compact and explicit.  Store the complete
   source explicitly and prove that it contains no unknown correction field.
3. Verify the two-derivative background, perturbative linearity, Page first
   integrals and radial Einstein constraint before solving.
4. Solve and verify in this order: generic static sector; equal-charge
   rotating benchmark; generic unequal charges at successive rotation orders;
   combined candidate exact in rotation.
5. Numerical or rational charge samples may guide discovery but cannot prove
   a generic identity.  Replace every sampled final check by symbolic
   arbitrary-charge verification.
6. Establish an upper bound on the rotation degree of each exact residual.
   Claim exactness only after every coefficient through that bound vanishes.
7. Substitute the final fields into the original reduced equations, not a
   solver-derived surrogate.  The decisive output must be literal exact zero
   or an exact Boolean derived from the residual.

PHYSICAL CHECKS
8. Fix the asymptotic frame and normalize physical Page charges and angular
   momentum.  Check horizon regularity on the regular perturbative branch.
9. Verify entropy directly with the Wald--Tachikawa prescription appropriate
   to the complete invariant and compare only after charge and convention
   dictionaries are explicit.
10. Prove the static transformation between the areal proof coordinate and
    the harmonic/isotropic-like paper coordinate.  A rotation-independent
    pullback may be used at finite rotation, but do not call it a unique fully
    isotropic rotating gauge without an additional gauge condition.
11. Keep the five-dimensional EOM solution logically separate from the
    ten-to-five-dimensional field map.  Distinguish identities on the BMPV
    solution space from universal off-shell field redefinitions.

EVIDENCE STANDARD
- Evaluate every decisive notebook from a fresh Mathematica kernel.
- Record kernel messages, final predicates, execution time and content hash.
- Separate discovery notebooks from decisive verification notebooks.
- Do not import the target solution into a purported source-side derivation.
- Preserve failed routes, nonzero witnesses, corrected conventions and
  superseded claims.
- Ask an independent auditor to reconstruct critical residuals without
  trusting existing PASS labels.
- Never overwrite a sealed release.

DELIVERABLES
- convention and notation ledgers;
- explicit EOM and source archive;
- compact homogeneous system and solution notebooks;
- literal from-EOM exact-in-rotation verifier;
- charge, angular-momentum, horizon, entropy and coordinate certificates;
- separately scoped field-map certificates and limitations;
- chronological report, solving-process guide and notebook index;
- fresh-kernel logs, independent audit, checksums and release manifest.

CLAIM BOUNDARY
Report separately: proved identities, solution-space identities, conditional
comparisons, rejected routes and open off-shell questions.  Do not infer
second order in the higher-derivative coupling, validity at the classical
zero-area bound, or a unique universal field redefinition from a first-order
on-solution verification.
```

## Inputs required for a blind run

Provide the action, background solution, references, convention ledger and
pre-existing static methodology.  Withhold the corrected rotating fields,
decisive notebooks, expected residual values and audit reports.  Record a hash
of the candidate result before unblinding it against the released evidence.

