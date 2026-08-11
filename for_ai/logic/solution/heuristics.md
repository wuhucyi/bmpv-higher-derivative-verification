# Discovery heuristics

These heuristics explain choices made during discovery. None is evidence by
itself.

## Rotation-parity decomposition

- **Rationale:** the stationary ansatz separates naturally into parity-even
  and parity-odd correction blocks.
- **Sensitivity:** a convention error in a parity-odd term can contaminate the
  odd block while leaving static tests unchanged.
- **Bounds:** use only through the independently justified maximum source
  degree.
- **Code:** NB06, NB08, NB09, NB10, NB12.
- **Source:** the explicit reduced EOM and observed background parity.

## Exact rational reconstruction

- **Rationale:** direct symbolic integration at `O(j^2)` became unwieldy, while
  exact rational charge samples exposed denominator and symmetry structure.
- **Sensitivity:** underfit samples can create spurious null modes.
- **Bounds:** samples generate candidates only; arbitrary-charge substitution
  is mandatory.
- **Code:** NB08 and the decisive NB12 check.
- **Source:** the chronological solving process and retained failed tests.

## Equal-charge benchmark

- **Rationale:** symmetry reduces the system enough to expose sign, gauge, and
  normalization mistakes early.
- **Sensitivity:** success at equal charge does not imply the generic result.
- **Bounds:** benchmark and regression test only.
- **Code:** NB04 and NB05.
- **Source:** the inherited STU/BMPV methodology.

## Raw-potential-first dualization

- **Rationale:** the historical three-form-first object was nonclosed at
  generic rotation.
- **Sensitivity:** duality sign, Hodge-star convention, and target leakage.
- **Bounds:** establishes an exact solution-space identity, not a universal
  off-shell map.
- **Code:** rejected NB27; successful NB31; boundary NB32.
- **Source:** exact closure and rank witnesses.
