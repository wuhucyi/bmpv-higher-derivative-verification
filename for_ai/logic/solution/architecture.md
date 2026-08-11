# Solution architecture

The calculation is a directed verification graph rather than one monolithic
solve.

1. Fix orientation, gauge, coordinate, perturbative, and ensemble conventions.
2. Build thirteen explicit equations in the form
   `E2_linear[corrections] + E4_source[background] = 0`.
3. Reduce the electric equations to Page first integrals and retain the radial
   Einstein constraint.
4. Establish the equal-charge rotating benchmark and the generic static seed.
5. Solve the generic parity blocks at orders `j`, `j^2`, and `j^3`.
6. Bound the source degree and substitute the combined candidate into the
   original equations to prove exact closure in rotation.
7. Audit physical charges, angular momentum, horizon regularity, entropy, and
   the radial-coordinate map.
8. Treat the heterotic-to-STU comparison as a separate branch: component map,
   rejected three-form-first route, raw-potential-first solution-space map,
   and source-side underdetermination.

The stable identifiers in [`../claims.md`](../claims.md),
[`../experiments.md`](../experiments.md), and
[`../../src/index.md`](../../src/index.md) are the public interface of this
graph.
