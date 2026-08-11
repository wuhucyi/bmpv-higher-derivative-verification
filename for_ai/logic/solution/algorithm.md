# Symbolic verification algorithm

1. Start a fresh Wolfram kernel and load no external initialization file.
2. Verify notebook byte count and SHA-256 against the source index.
3. Construct exact rational expressions; do not introduce floating-point
   values.
4. Verify the two-derivative background and perturbative linearity.
5. Confirm that every four-derivative source is evaluated only on the
   uncorrected background.
6. Apply Page and radial-constraint reductions only after matching them to the
   original equations.
7. Use samples or collocation only for discovery. Reconstruct generic charge
   dependence and substitute it symbolically before accepting a claim.
8. For exact rotation, derive the maximum residual degree and test every
   coefficient through that bound.
9. Evaluate the designated negative controls: sign/orientation guards,
   coefficient perturbation, and the rejected nonclosed field-map route.
10. Record kernel version, messages, literal residuals, terminal predicate,
    elapsed time when available, and content hash.
11. Resolve the outcome through the claim and experiment ledgers; never infer
    a stronger scope than the ledger states.
