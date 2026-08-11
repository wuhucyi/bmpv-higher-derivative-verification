# Reproduction environment

## Tested environment

- Wolfram Mathematica 14.1.0.
- Recorded verification kernel:
  `14.1.0 for Mac OS X ARM (64-bit) (July 16, 2024)`.
- All 34 assigned fresh-kernel logs record that kernel string.
- Operating system family: macOS.
- Exact OS version, hardware model, CPU, memory, and discovery-run parameters
  were not uniformly recorded and must not be guessed.

## Execution protocol

1. Verify repository checksums before execution.
2. Start a new kernel for each decisive notebook.
3. Evaluate NB00A before interpreting parity-odd calculations.
4. Treat NB00 as a derivation scaffold with resource-bounded stages.
5. Use NB12 as the decisive equation-level exact-in-rotation verifier.
6. Use NB21 as an independent entropy reconstruction; it must not execute
   NB20.
7. Use NB30-NB32 for the final field-map scope and limitation boundary.
8. Require the assigned log to match notebook basename, byte count, and
   SHA-256 and to end with the declared terminal markers.

Notebooks are the sole executable calculation format in this compact view.
No `.wl`, `.wls`, `.m`, or `.mx` file is part of the repository. Full
reproduction requires a compatible licensed Wolfram kernel.
