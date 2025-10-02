# 2025 Posit Table Contest Submission

Author: **Maciej Nasinski** ([GitHub: @Polkas](https://github.com/Polkas))

## Overview

This repository provides a reproducible example of generating a submission‑quality clinical Table (TLG style) using **gt** + **gridify** (for regulatory style framing) with synthetic CDISC-like data from `random.cdisc.data`. 

Clinical reporting sits at the intersection of statistical rigor, regulatory expectation, and reproducible communication. 
While pharmaverse packages address analysis, a persistent gap remains: consistent contextual framing of tables, listings, and graphs (TLGs). 
gridify closes that gap. Built on base grid, it lets users declaratively position headers, multi-line titles, population labels, footnotes, and compliance notices around any visual or tabular object. 
Combined with gt, users retain elegant tabular styling while gaining precise external framing. When a predefined pharma layout is not enough, the user can define custom semantic zones—then preview or iterate rapidly, even inside a Shiny app. 
The showcased TLG example reflects the type of submission-quality artifact that helps advance investigational products toward patients—delivered with greater speed, clarity, and reproducibility.

## How to Run

`table_posit.R` – generates the contest table and writes the PNG to `outputs/`.

Outputs are in the `outputs` directory:

- `polkas_table_contest_2025.png`
- `polkas_table_contest_2025.pdf`

## Data

All data are synthetic (randomly generated but deterministic) via `random.cdisc.data`; no real patient data are used.

## Dependencies (R packages)

- gt
- gridify
- random.cdisc.data
- dplyr
- scales

## License

MIT