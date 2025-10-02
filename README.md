# 2025 Posit Table Contest Submission

Author: **Maciej Nasinski** ([GitHub: @Polkas](https://github.com/Polkas))

## The Problem

Clinical reporting requires tables that meet both statistical rigor and regulatory standards.
While pharmaverse packages handle analysis well, a gap remains in consistent, reproducible framing of Tables, Listings, and Graphs (TLGs) with headers, footers, compliance notices, and metadata required for submissions.

## The Solution

This example demonstrates combining **{gt}** for table styling with **{gridify}** for regulatory-compliant framing. 
{gridify} is built on base {grid} and enables declarative positioning of headers, titles, population labels, footnotes, and compliance notices around any tabular or graphical object.

Key capabilities:

- Predefined pharma layouts matching regulatory expectations
- Custom layouts when predefined templates aren't sufficient  
- Pure R workflow from data to final output
- Rapid iteration and preview

## This Example

A CDISC ADSL baseline characteristics table showing Biomarker 1 (BMRKR1) by treatment arm and geographic region, with:

- Summary statistics: n, Mean (SD) with gradient color encoding
- Complete regulatory framing: protocol info, data cut-off, confidentiality notices, traceability
- Data source: Synthetic CDISC data from {random.cdisc.data} (not real patient data)

## Why It Matters

This workflow produces submission-quality artifacts that help advance investigational products toward patients, delivered with greater speed, clarity, and reproducibility. 
Combined with {gt}'s styling, {gridify} enables pharma statisticians to produce elegant, compliant outputs without sacrificing reproducibility.

## How to Run

`table_posit.R` – generates the contest table and writes the PNG to `outputs/`.

Outputs are:

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