# Notation crosswalk

## Purpose and manuscript snapshot

This guide connects three notation layers: the current research manuscript,
the version-5 verification report, and the Mathematica notebooks. It is a
reading aid, not a replacement for definitions in the paper or for the
executable checks.

The manuscript snapshot used here is `main.tex` from the authors' Overleaf
download with SHA-256
`6f6b5a7ad6d3b3d364f3eec297315422beaac575388b8e142f29579e44b977de`.
This crosswalk is tied to that manuscript snapshot and should be reviewed
after manuscript revisions.

## Parameters and physical quantities

| Manuscript | Verification report | Notebook | Meaning |
|---|---|---|---|
| `q_I` | `mu_I` | `q1`, `q2`, `q3` | Harmonic-function parameters in `H_I=1+q_I/r^2`; these are not themselves the normalized conserved charges. |
| not introduced separately | `Q_I^phys` | fixed Page constants | Physical electric charges, `Q_I^phys=pi q_I/(4 G_5)` in the conventions used here; the manuscript currently calls `q_I` charges without introducing this normalized glyph. |
| `a` | `j` | `jrot` | Single equal-angular-momentum rotation parameter; `J_1=J_2=pi a/(4 G_5)`. |
| `G_N` | `G_5` | not abbreviated | Five-dimensional Newton constant. |
| `lambda_3` | `lambda_3` | implicit overall first-order coefficient | Active single-invariant coupling; `lambda_3=alphaPrime/8` for the heterotic specialization. |
| `lambda_I` | permuted single-sector couplings | sector permutations | The general first-order answer is the linear superposition of the three permuted single-active-sector corrections. |
| `mathcal H=H_1 H_2 H_3` | harmonic product | explicit products of the notebook harmonic functions | Product of the three harmonic functions. |
| `w=a/sqrt(q_1 q_2 q_3)` | `u=j/sqrt(mu_1 mu_2 mu_3)` | derived quantity | Dimensionless horizon spin; not the rotation one-form `omega` and not a normal vector. The report uses `varpi` only in its equal-charge literature-comparison subsection. |

## Coordinates and radial gauge

For clarity, this crosswalk denotes the verification report's harmonic,
paper-like coordinate `rho` by `r_P`, and its areal/Schwarzschild-like
EOM-solver coordinate `r` by `r_A`. In the latter gauge,
`delta mathcal H_A=0` fixes the angular metric exponent. For the static sector,
NB28 proves the exact first-order map (written `rho=r+lambda_3 xi(r)` in the
report)

```text
r_P = r_A + lambda_3 xi(r_A).
```

At finite rotation, NB28 applies the same rotation-independent `xi` as a
well-defined paper-matched pullback and explicitly does not claim a unique
rotating isotropic gauge. The manuscript states that its displayed corrected
solution follows a transformation to `delta varphi_2=0`, but its retained
radial symbol is not explicit; equality of that finite-rotation manuscript
coordinate with the report's chosen paper-matched pullback therefore remains
an author-confirmation point. Correction functions are not directly compared
across gauges without the appropriate pullback. The distinction vanishes at
two derivatives. In the compact radial EOM and solution notebooks, the alias
`x` means `r_A^2`.

The manuscript reuses `r` before and after writing `r -> bar r(r)`. Which
coordinate retains the glyph `r` should be confirmed explicitly in the
manuscript; this crosswalk does not infer that identification.

## Fields and correction variables

| Manuscript | Verification report | Notebook | Meaning |
|---|---|---|---|
| exponent functions `f,g,h,k` | `mathcal F,mathcal G,mathcal H,mathcal K` | notebook-family dependent | Temporal, radial, angular-area, and Hopf-fibre-squashing metric exponents in the same gauge. |
| `u_I` | `u_I` | `U1`, `U2`, `U3` for `delta u_I` | Electric components of `A^I`. |
| `v_I` | `v_I` | reconstructed from adapted variables | Hopf-fibre components of `A^I`. |
| no separate symbol | `beta_I` | `B1`, `B2`, `B3` | Genuine fibre correction after induced electric and co-rotating pieces are removed. |
| `omega` | `omega` or its coefficient | `Om` for `delta omega` | Rotation one-form, or contextually its scalar coefficient multiplying `sigma_L^3`. |
| `varphi_1,varphi_2` | `varphi_1,varphi_2` | `P`, `S` for their corrections | `P=-sqrt(6) delta varphi_1/4`; `S=delta varphi_2/sqrt(2)`. |

The explicit-EOM archive uses `df,dgr,dhr,dsqu,domega`. Compact solution and
verification notebooks use `Ft,Gr,K,Om`; some inherited explanatory cells use
`Sq` for squashing. In the areal solver gauge the angular-area correction
corresponding to `dhr` is set to zero, so no universal `Hr` alias exists.

The adapted fibre correction is defined by

```text
beta_I = delta v_I - omega_0 delta u_I - H_I^(-1) delta omega.
```

It is not merely another name for `delta v_I`. The short notebook aliases
`Ft`, `Gr`, `K` or `Sq`, and `Om` mean temporal warp, radial warp, squashing,
and rotation correction; `Sq` is not a field strength.

## Same glyph, different object

- Manuscript `mathcal H` denotes `H_1 H_2 H_3`, whereas report `mathcal H` in
  the corrected ansatz is the angular metric exponent.
- Manuscript ansatz `f(r)` is a logarithmic temporal exponent. Report
  background shorthand `f=(H_1 H_2 H_3)^(-1/3)` is a different object; at
  leading order `exp(2 f_manuscript)=f_report^2`.
- `omega` may mean the full one-form or its scalar Hopf-fibre coefficient.
- Manuscript `varepsilon_{mu nu}` in the Wald formula is the horizon binormal,
  not the five-dimensional Levi-Civita tensor or alternating density.
- The calligraphic horizon label in entropy prose is not either use of
  `mathcal H` above.

## Orientation objects

The supplement distinguishes three objects:

- the orthonormal-frame symbol, with `epsilon_01234=+1` and
  `epsilon^01234=-1`;
- the curved Levi-Civita tensor, which contains the vielbein or determinant;
- the alternating coordinate density used by raw Mathematica arrays.

In notebook coordinate order `(t,r,theta,phi,psi)`, the certified conventions
give `epsilon_(t r theta phi psi)=-sqrt(-g)` and
`epsilon^(t r theta phi psi)=+1/sqrt(-g)`. See NB00A and NB29 before modifying
any parity-odd term.

## Equal charge is not automatically minimal supergravity

The report's short equal-charge check sets the three harmonic parameters equal
while keeping only `lambda_3` active. It therefore allows
`delta u_1=delta u_2 != delta u_3` and a nonzero scalar correction. The
minimal-supergravity truncation in the manuscript additionally sets
`lambda_1=lambda_2=lambda_3=lambda/3` and superposes the three permuted
sectors. These two specializations must not be identified term by term.

## Manuscript points requiring author confirmation

The crosswalk does not silently repair the following source-text issues:

1. The leading solution currently prints `X^I=mathcal H/H_I`; the scalar
   constraint and later formulas require `X^I=mathcal H^(1/3)/H_I`.
2. The displayed mixed `A^I R R` term shows an epsilon with four written
   indices while also contracting `A_lambda`; the intended five-dimensional
   term requires the fifth index to be explicit.
3. The manuscript does not explicitly say whether its action epsilon is a
   curved tensor or an alternating density.
4. The Wald prose first calls the two normals `u,w`, while the display uses
   `u,v` and later reserves `w` for dimensionless spin.
5. Expressions such as `lambda_I/q_I` in the entropy section appear to rely on
   an index sum, but the crosswalk does not impose summation semantics that the
   manuscript has not stated.
6. `partial log H_I` should be read as the derivative with respect to the
   retained manuscript radial coordinate; the paper should define this
   shorthand and its coordinate explicitly.
7. In the displayed derivative of the Lagrangian with respect to
   `R_(mu nu rho sigma)`, the second field-strength factor appears to repeat
   `mu nu`; its free indices should be checked against the intended
   `rho sigma` pair.

These are manuscript-editing notes, not failures of the archived notebook
certificates.
