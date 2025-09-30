# 2025 Posit Table & Plotnine Contest Submission

Author: **Maciej Nasinski** ([GitHub: @Polkas](https://github.com/Polkas))

## Overview

This repo shows how to use R to create submission-ready clinical Tables, Listings, and Graphs (TLGs) with full context—using **gt**/**ggplot2** and **gridify** for consistent layout.  
All code, synthetic data, and steps are included for reproducibility.  
Outputs match the expected clinical reporting look, with headers, protocol info, population labels, notes, and footers.

The main idea of this entry is to demonstrate how R can be used to produce submission-quality Tables, Listings, and Graphs (TLGs) for clinical reporting. 
By combining powerful packages like **gt**/**ggplot2** and **gridify** for layout, we can achieve a consistent, transparent, and fully reproducible presentation that matches regulatory expectations for structure and appearance. 

## How to Run

`plot_posit.R` - generate plot for the Contest Submission  
`table_posit.R` - generate table for the Contest Submission

Outputs are in the `outputs` directory.

## Data

All data are synthetic, generated via `random.cdisc.data` - no real patient data.

## License

MIT