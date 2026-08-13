# Executable source index

## Resolution rules

- `repository` notebooks resolve under [`notebooks/`](notebooks/).
- `repository_compressed` notebooks resolve alongside the other files in
  [`notebooks/`](notebooks/) and must match both the compressed and restored
  identities in
  [`../evidence/notebook_archives.yaml`](../evidence/notebook_archives.yaml).
- Every log resolves under [`../evidence/logs/`](../evidence/logs/).
- Evaluate each notebook in a fresh Wolfram kernel. The assigned log must end
  with `FRESH_KERNEL_FINAL_PASS=True`, followed by
  `FRESH_KERNEL_SEQUENTIAL_EVALUATION_END`.
- Experiment IDs resolve through [`../logic/experiments.md`](../logic/experiments.md).

## Notebook ledger

| ID | Availability | File or object | Log | Tier | Role | Experiment |
|---|---|---|---|---|---|---|
| NB00A | repository | `00A_Levi_Civita_Tensor_and_Action_Density_Convention.nb` | `00A_Levi_Civita_Tensor_and_Action_Density_Convention_fresh_kernel.log` | V3 | orientation and mixed-CS convention guard | EXP-EPSILON-001 |
| NB00 | repository | `00_Ansatz_Action_and_EOM_Derivation.nb` | `00_english_metadata_sanitization_fresh_kernel.log` | V1 | action/ansatz derivation scaffold with resource-bounded stages | EXP-EOM-001 |
| NB01 | repository_compressed | `01_Explicit_13_EOM_with_Sources.nb.gz` | `01_fresh_kernel_full_eval.log` | V1 | literal archive of thirteen linearized equations and sources | EXP-EOM-001 |
| NB02 | repository_compressed | `02_Page_and_Radial_Constraint_Reduction.nb.gz` | `02_fresh_kernel_full_eval.log` | V1 | Page first integrals and radial constraint | EXP-EOM-001 |
| NB03 | repository | `03_Source_Sectors_and_F4_Interpretation.nb` | `03_Source_Sectors_and_F4_Interpretation_fresh_kernel.log` | V2 | source sectors and curvature-free vector invariants | EXP-F4-SEPARATE-001, EXP-F4-ENTROPY-001 |
| NB04 | repository | `04_Equal_Charge_Exact_Solution.nb` | `04_Equal_Charge_Exact_Solution_fresh_kernel.log` | V2 | equal-charge closed solution | EXP-EQUAL-001 |
| NB05 | repository | `05_Equal_Charge_13of13_Validation.nb` | `05_Equal_Charge_13of13_Validation_fresh_kernel.log` | V3 | direct equal-charge substitution | EXP-EQUAL-001 |
| NB06 | repository | `06_Generic_Unequal_Charge_OrderJ_Solution.nb` | `06_Generic_Unequal_Charge_OrderJ_Solution_fresh_kernel.log` | V2 | generic unequal-charge linear rotation | EXP-GENERIC-J1-001 |
| NB07 | repository | `07_Physical_Charges_and_Angular_Momentum.nb` | `07_Physical_Charges_and_Angular_Momentum_fresh_kernel.log` | V3 | fixed charges and rotation normalization | EXP-GENERIC-J1-001, EXP-CHARGE-001 |
| NB08 | repository | `08_Generic_OrderJ2_Reduced_System_and_Closed_Solution.nb` | `08_Generic_OrderJ2_Reduced_System_and_Closed_Solution_fresh_kernel.log` | V2 | generic parity-even quadratic solution | EXP-GENERIC-J2-001 |
| NB09 | repository | `09_Generic_OrderJ3_Odd_Block_and_Closed_Solution.nb` | `09_Generic_OrderJ3_Odd_Block_and_Closed_Solution_fresh_kernel.log` | V2 | generic parity-odd cubic solution | EXP-GENERIC-J3-001 |
| NB10 | repository | `10_Exact_Rotation_Closure_and_Source_Degree_Audit.nb` | `10_Exact_Rotation_Closure_and_Source_Degree_Audit_fresh_kernel.log` | V3 | maximum source degree and rotation closure | EXP-EXACT-J-001 |
| NB11 | repository | `11_Combined_Generic_ExactInJ_Solution_and_Validation_Ledger.nb` | `11_Combined_Generic_ExactInJ_Solution_and_Validation_Ledger_fresh_kernel.log` | V2 | combined exact-in-rotation fields and ledger | EXP-EXACT-J-001 |
| NB12 | repository | `12_True_FromEOM_ExactInJ_Verifier.nb` | `12_true_from_eom_machine_audit.log` | V4 | decisive literal from-EOM verifier | EXP-EXACT-J-001 |
| NB13 | repository | `13_Generic_Static_UnequalCharge_Exact_Certificate.nb` | `13_Generic_Static_UnequalCharge_Exact_Certificate_fresh_kernel.log` | V3 | generic static thirteen-equation certificate | EXP-STATIC-001 |
| NB14 | repository | `14_Generic_Wald_Tachikawa_and_Physical_Normalization.nb` | `14_Generic_Wald_Tachikawa_and_Physical_Normalization_fresh_kernel.log` | V3 | physical normalization and Wald checks | EXP-CHARGE-001 |
| NB15 | repository | `15_Generic_ExactInJ_Horizon_Regularity.nb` | `15_Generic_ExactInJ_Horizon_Regularity_fresh_kernel.log` | V3 | positive-gap horizon regularity | EXP-HORIZON-001 |
| NB16 | repository | `16_Cassani_Heterotic_and_Eq331_Matching_Ledger.nb` | `16_Cassani_Heterotic_and_Eq331_Matching_Ledger_fresh_kernel.log` | V2 | coupling symmetry, heterotic anchor, and vector-invariant ledger | EXP-LAMBDA-SUPERPOSITION-001, EXP-F4-SEPARATE-001, EXP-F4-ENTROPY-001 |
| NB17 | repository | `17_Generic_Page_Reduced_Radial_Identity.nb` | `17_Generic_Page_Reduced_Radial_Identity_fresh_kernel.log` | V3 | generic Page-reduced radial identity | EXP-CHARGE-001 |
| NB18 | repository | `18_Entropy_Convention_and_Literature_Comparison.nb` | `18_Entropy_Convention_and_Literature_Comparison_fresh_kernel.log` | V2 | entropy convention comparison | EXP-ENTROPY-001 |
| NB19 | repository | `19_Rotating_Heterotic_to_STU_Field_Map_Candidate.nb` | `19_Rotating_Heterotic_to_STU_Field_Map_Candidate_fresh_kernel.log` | V1 | historical rotating map ledger | supporting provenance |
| NB20 | repository | `20_Direct_5D_Wald_Tachikawa_Entropy.nb` | `20_Direct_5D_Wald_Tachikawa_Entropy_fresh_kernel.log` | V3 | direct entropy computation | EXP-ENTROPY-001, EXP-F4-ENTROPY-001 |
| NB21 | repository | `21_Independent_Direct_Entropy_Verifier.nb` | `21_Independent_Direct_Entropy_Verifier_fresh_kernel.log` | V4 | independent entropy reconstruction | EXP-ENTROPY-001 |
| NB22 | repository | `22_Corrected_Rotating_Winding_MixedIndex_LorentzCS_Certificate.nb` | `22_Corrected_Rotating_Winding_MixedIndex_LorentzCS_Certificate_fresh_kernel.log` | V3 | rotating winding and Lorentz-CS certificate | supporting provenance |
| NB23 | repository | `23_Complete_TenComponent_Corrected_Dualization_Source.nb` | `23_Complete_TenComponent_Corrected_Dualization_Source_fresh_kernel.log` | V3 | sector-separated dualization source | supporting provenance |
| NB24 | repository | `24_Field_Map_Convention_and_Static_Anchor_Certificate.nb` | `24_Field_Map_Convention_and_Static_Anchor_Certificate_fresh_kernel.log` | V3 | field-map convention and static anchor | supporting provenance |
| NB25 | repository | `25_Independent_Lower_TwoForm_Field_Redefinition_Certificate.nb` | `25_Independent_Lower_TwoForm_Field_Redefinition_Certificate_fresh_kernel.log` | V4 | independent lower-two-form direction | supporting provenance |
| NB26 | repository | `26_Corrected_Postdual_Scalar_Map_Certificate.nb` | `26_Corrected_Postdual_Scalar_Map_Certificate_fresh_kernel.log` | V2 | postdual scalar map and discovery samples | supporting provenance |
| NB27 | repository | `27_Rotating_C3_Obstruction_and_Rank_Certificate.nb` | `27_Rotating_C3_Obstruction_and_Rank_Certificate_fresh_kernel.log` | V3 | rejected three-form-first endpoint | EXP-MAP-C3-THREEFORM-ROUTE-001 |
| NB28 | repository | `28_Paper_Radius_to_Areal_Coordinate_Certificate.nb` | `28_Paper_Radius_to_Areal_Coordinate_Certificate_fresh_kernel.log` | V3 | exact two-way coordinate map | EXP-COORD-001 |
| NB29 | repository | `29_V1_Parity_Odd_Compatibility_Certificate.nb` | `29_V1_Parity_Odd_Compatibility_Certificate_fresh_kernel.log` | V4 | retrospective parity-odd audit | EXP-EPSILON-001, EXP-V1-SIGN-001 |
| NB30 | repository | `30_Generic_Rotating_Scalar_Symbolic_Proof.nb` | `30_Generic_Rotating_Scalar_Symbolic_Proof_fresh_kernel.log` | V4 | arbitrary-charge rotating scalar proof | EXP-MAP-SCALAR-001 |
| NB31 | repository | `31_Raw_First_Exact_Rotating_Third_Vector_Map.nb` | `31_Raw_First_Exact_Rotating_Third_Vector_Map_fresh_kernel.log` | V4 | raw duality and exact solution-level third-vector map | EXP-MAP-RAW-DUAL-001, EXP-MAP-C3-SOLUTION-001 |
| NB32 | repository | `32_Appendix_B_Boundary_Current_No_Go.nb` | `32_Appendix_B_Boundary_Current_No_Go_fresh_kernel.log` | V4 | displayed-source insufficiency and underdetermination | EXP-MAP-SOURCE-NOGO-001, EXP-MAP-OFFSHELL-001 |

NB26's rotating samples are discovery evidence only; NB30 supplies the generic
rotating scalar proof. NB27 is a preserved rejected route; NB31 supplies the
valid raw-potential-first endpoint.
