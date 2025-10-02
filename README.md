# 2025 Posit Table Contest Submission

Author: **Maciej Nasinski** ([GitHub: @Polkas](https://github.com/Polkas))

## Overview

This repository provides a reproducible example of generating a submission‑quality clinical Table (TLG style) using **gt** + **gridify** (for regulatory style framing) with synthetic CDISC-like data from `random.cdisc.data`. 
The focus is solely on the 2025 Posit Table Contest (the previous exploratory plot script has been deprecated and omitted from the submission scope).

## How to Run

`table_posit.R` – generates the contest table and writes the PNG to `outputs/`.

Outputs are in the `outputs` directory:

- `polkas_table_contest_2025.png`

## Data

All data are synthetic (randomly generated but deterministic) via `random.cdisc.data`; no real patient data are used.

## Dependencies (R packages)

- dplyr
- gt
- gridify
- random.cdisc.data
- scales

(Install as needed; package versions not pinned here—can be captured later with `renv` if desired.)

## Notes

- Layout metadata (titles, headers, footers) are populated dynamically from a parameter block in the script for easy reuse.
- Biomarker values are displayed as Mean (SD) by treatment arm and region.
- Colors are applied conservatively to maintain readability.

## License

MIT