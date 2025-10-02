# =====================================================================
# 2025 Posit Table Contest Entry
# Title: CDISC ADSL Baseline Snapshot by Region and Treatment Arm
# Author: Maciej Nasinski (GitHub: @Polkas)
# Data: Synthetic (random.cdisc.data) - Not real patient data
# =====================================================================
# Description

# Clinical reporting sits at the intersection of statistical rigor, regulatory expectation, and reproducible communication. 
# While pharmaverse packages address analysis, a persistent gap remains: consistent contextual framing of tables, listings, and graphs (TLGs). 
# gridify closes that gap. Built on base grid, it lets users declaratively position headers, multi-line titles, population labels, footnotes, and compliance notices around any visual or tabular object. 
# Combined with gt, users retain elegant tabular styling while gaining precise external framing. When a predefined pharma layout is not enough, the user can define custom semantic zones—then preview or iterate rapidly, even inside a Shiny app. 
# The showcased TLG example reflects the type of submission-quality artifact that helps advance investigational products toward patients—delivered with greater speed, clarity, and reproducibility.

# Setup
library(dplyr)
library(gt)
library(gridify)
library(random.cdisc.data)
library(scales)

primary_color   <- "#08306b"
secondary_color <- "#6baed6"

# Data Preparation

adsl <- random.cdisc.data::cadsl |>
  mutate(
    ARM = factor(ARM),
    REGION1 = factor(REGION1)
  )

summary_tbl <- adsl |>
  group_by(ARM, REGION1) |>
  summarise(
    N = n(),
    MEAN_BMRKR1 = mean(BMRKR1, na.rm = TRUE),
    SD_BMRKR1 = sd(BMRKR1, na.rm = TRUE),
    .groups = "drop"
  ) |>
  mutate(
    MEAN_BMRKR1 = round(MEAN_BMRKR1, 2),
    SD_BMRKR1 = round(SD_BMRKR1, 2)
  ) |>
  mutate(
    BMRKR1 = factor(sprintf("%0.2f (%0.2f)", MEAN_BMRKR1, SD_BMRKR1), levels = )
  ) |>
  mutate(
    BMRKR1 = factor(BMRKR1, levels = BMRKR1[order(MEAN_BMRKR1)])
  ) |>
  select(ARM, REGION1, N, BMRKR1)

# gt Table
gt_tbl <- summary_tbl |>
  gt(rowname_col = NULL, groupname_col = "ARM") |>
  cols_label(
    REGION1 = "Region",
    N = "n",
    BMRKR1 = "BMRKR1"
  ) |>
  cols_width(
    ARM ~ pct(30),
    REGION1 ~ pct(30),
    N ~ pct(10),
    BMRKR1 ~ pct(30)
  ) |>
  cols_align(
    align = "center",
    columns = N
  ) |>
  tab_options(
    table.width = pct(70),
    table.font.size = 16,
    data_row.padding = px(6),
    table.font.color = "black",
    table.font.weight = "400",
    heading.align = "left",
    table.background.color = "gray98",
    heading.background.color = "gray98",
    column_labels.background.color = "gray95",
    row_group.font.weight = "bold",
    row_group.as_column = TRUE
  ) |>
  opt_row_striping() |>
  data_color(
    columns = BMRKR1,
    colors = col_factor(
      palette = c("white", secondary_color, primary_color),
      domain = NULL
    )
  ) |>
  data_color(
    columns = N,
    colors = col_factor(
      palette = c("white", secondary_color, primary_color),
      domain = NULL
    )
  ) |>
  tab_style(
    style = cell_text(weight = "bold"),
    locations = list(cells_column_labels(), cells_title())
  ) |>
  tab_style(
    style = cell_text(color = primary_color),
    locations = cells_column_labels()
  ) |>
  tab_style(
    style = cell_text(color = primary_color),
    locations = cells_title(groups = "title")
  )

# Use predefined gridify pharma layout
pharma_gt <- gridify(
  gt_tbl,
  pharma_layout_base(
    margin = grid::unit(c(t = 0.5, r = 0.5, b = 0.5, l = 0.5), "inch"),
    global_gpar = grid::gpar(
      fontfamily = "mono",
      fontsize = 14,
      col = "black"
    )
  )
) |> 
  set_cell("header_left_1", "PharmaCorp International") %>%
  set_cell("header_left_2", "ONCOLOGY / Advanced NSCLC") %>%
  set_cell("header_left_3", "Study PC-2025-001") %>%
  set_cell("header_right_1", "CONFIDENTIAL") %>%
  set_cell("header_right_2", "Final") %>%
  set_cell("header_right_3", "Data Cut-off: 2025-09-30") %>%
  set_cell("output_num", "Table 14.1.1") %>%
  set_cell("title_1", "Summary of Demographics and Baseline Characteristics") %>%
  set_cell("title_2", "Baseline Biomarker 1 (BMRKR1) by Geographic Region") %>%
  set_cell("title_3", "Safety Analysis Set") %>%
  set_cell("note", "Note: BMRKR1 values shown as Mean (SD).") %>%
  set_cell("references", "Source: ADSL dataset random.cdisc.data") %>%
  set_cell("footer_left", sprintf("Program: table_posit.R, %s", format(Sys.time(), "%Y-%m-%d %H:%M %Z"))) %>%
  set_cell("footer_right", "Page 1 of 1")

pharma_gt

pharma_gt |>
  export_to("polkas_table_contest_2025.png", width = 3000, height = 2600, res = 300)

pharma_gt |>
  export_to("polkas_table_contest_2025.pdf")


