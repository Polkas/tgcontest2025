# =====================================================================
# 2025 Posit Plotnine Contest Entry
# Title: CDISC ADSL Distribution of Biomarker 1 by Country
# Author: Maciej Nasinski (GitHub: @Polkas)
# Data: Synthetic (random.cdisc.data) - Not real patient data
# =====================================================================

# Description

# Clinical reporting remains a demanding, regulation-driven task.
# The pharmaverse ecosystem addresses analytic consistency.
# gridify extends this by supplying a clear, declarative layer for framing tables, listings, and graphs (TLGs) with the contextual text regulators expect: structured titles, protocol identifiers, population labels, footnotes, and disclosure statements. 
# This demonstration plot shows how easily a ggplot object can be wrapped with a submission-style context using gridify. 
# When needed, interactive refinement in Shiny enables rapid iteration without compromising reproducibility. 
# The result is a TLG-style figure representative of artifacts appearing in clinical study reports and submission packages that ultimately help advance therapies to patients. 
# Data shown are illustrative.

# Setup
library(ggplot2)
library(gridify)
library(random.cdisc.data)
library(forcats)
library(dplyr)

# Create ggplot2 boxplot: BMRKR1 by COUNTRY
plot_df <- adsl %>%
  filter(!is.na(BMRKR1)) %>%
  group_by(COUNTRY) %>%
  mutate(N_country = n()) %>%
  ungroup() %>%
  mutate(COUNTRY = fct_reorder(COUNTRY, BMRKR1, median, .desc = FALSE))

gg <- ggplot(
  data = plot_df,
  mapping = aes(COUNTRY, BMRKR1, fill = COUNTRY)
) +
  geom_violin(alpha = 0.55, color = NA, trim = FALSE) +
  geom_boxplot(width = 0.17, outlier.shape = NA, fill = "white", alpha = 0.7, color = "#333333") +
  stat_summary(
    fun = mean, geom = "point", shape = 23, size = 3,
    fill = "#ffdd55", color = "#333333", stroke = 0.7
  ) +
  scale_fill_viridis_d(option = "B") +
  labs(
    x = NULL, y = "BMRKR1",
  ) +
  theme_minimal(base_family = "mono") +
  theme(
    legend.position = "none",
    panel.grid.minor = element_blank(),
    plot.title.position = "plot",
    axis.text.x = element_text(angle = 25, hjust = 1)
  )

# Use gridify with predefined pharma_layout_base
final_gg <- gridify(
  object = gg,
  layout = pharma_layout_base(
    global_gpar = grid::gpar(fontfamily = "mono", fontsize = 12),
    margin = grid::unit(c(t = 0.5, r = 0.5, b = 0.5, l = 0.5), "inch")
  )
) |>
  set_cell("header_left_1", "My Company") %>%
  set_cell("header_left_2", "<PROJECT> / <INDICATION>") %>%
  set_cell("header_left_3", "<STUDY>") %>%
  set_cell("header_right_1", "CONFIDENTIAL") %>%
  set_cell("header_right_2", "<Draft or Final>") %>%
  set_cell("header_right_3", "Data Cut-off: YYYY-MM-DD") %>%
  set_cell("output_num", "<Output> xx.xx.xx") %>%
  set_cell("title_1", "<Title 1>") %>%
  set_cell("title_2", "<Title 2>") %>%
  set_cell("title_3", "<Optional Title 3>") %>%
  set_cell("by_line", "By: <GROUP>, <optionally: Demographic parameters>") %>%
  set_cell("note", "<Note or Footnotes>") %>%
  set_cell("references", "<References:>") %>%
  set_cell("footer_left", "Program: <PROGRAM NAME>, YYYY-MM-DD at HH:MM") %>%
  set_cell("footer_right", "Page xx of nn")


final_gg

# raw grid code - can be reevaluated
grid_code <- print(final_gg)

# export the output
final_gg |>
  export_to("outputs/polkas_plotnine_contest_2025.png", width = 4000, height = 2500, res = 300)