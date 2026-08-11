# Concepts and conventions

These definitions are normative for every claim and experiment.

## Perturbative order

For each ansatz field,

`Y(r,j) = Y_BMPV(r,j) + lambda3 deltaY(r,j) + O(lambda3^2)`.

Only first order in `lambda3` is retained. In the heterotic comparison,
`lambda3 = alphaPrime/8`. Exactness in `j` never means exactness beyond first
order in the higher-derivative coupling.

## Coordinates and radial gauge

- `r` is the areal/Schwarzschild-like solver radius; the correction to the
  selected areal function is fixed to zero.
- `rho` is the harmonic/isotropic-like paper radius.
- The generic static two-way map is exact at first order. Reusing its
  rotation-independent pullback at finite rotation defines a paper-matched
  coordinate, not a unique fully isotropic rotating gauge.

## Orientation and Levi-Civita objects

- Signature: mostly plus.
- Orthonormal-frame symbol: `epsilon_01234 = +1` and
  `epsilon^01234 = -1`.
- Curved tensors include the vielbein/determinant factors.
- The chart `(t,r,theta,phi,psi)` reverses the chosen physical orientation, so
  `epsilon_(t r theta phi psi) = -sqrt(-g)` and
  `epsilon^(t r theta phi psi) = +1/sqrt(-g)`.
- A Mathematica alternating array is not automatically the curved tensor.

## Gauge fields and ensemble

The leading BMPV potential uses the positive sign convention
`A0^I = H_I^(-1) (dt + j sigma_L^3/(2 r^2))`. Physical comparisons use fixed
Page charges, with `Q_I = pi mu_I/(4 G_5)` and equal angular momenta
`J_1 = J_2 = pi j/(4 G_5)`.

## Rotation exactness

Within the stationary equal-angular-momentum ansatz, the first-order
parity-even correction terminates at `j^2`, the parity-odd correction at `j^3`,
and the complete residual is checked through the maximum degree allowed by the
sources.

## Evidence classes

- **Established:** exact proof at the stated scope.
- **Established with scope:** exact proof carrying an explicit limitation.
- **Rejected route:** an attempted construction with a preserved failure
  witness; it is not evidence against unrelated routes.
- **Not established:** an open claim with a stated requirement for resolution.

Saved output and PASS strings are metadata. Decisive evidence is a
reconstructible exact calculation.

## Field-map strength

An identity verified on the stationary rotating solution space is weaker than
a manifestly covariant off-shell field redefinition. The two must remain
separate in claims, experiments, and summaries.

## Notebook aliases

Inherited notebook symbols such as `x`, `Ft`, `Gr`, `Sq`, `Om`, `U1`, and `B1`
are implementation aliases for `r^2`, temporal/radial/squashing metric
corrections, the rotation-form correction, and gauge-potential corrections.
Human notation in the PDFs is canonical.
