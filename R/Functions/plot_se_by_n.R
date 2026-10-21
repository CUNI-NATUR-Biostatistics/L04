# CUNI-NATUR-Biostatistics L04 — slope SE against the number of eruptions, 2026.
# Plot SE by n -----
# Draws the SE curve from `compute_se_by_n()` and labels the first `n_points`
#   rows of `data_points` (columns `pocet`, `se`, `text`). Uses
#   `biostat_cols` and `theme_biostat()` from `R/set_r_theme.R`.
plot_se_by_n <- function(data_curve, data_points, n_points, base_size = 20) {
  res_plot <-
    ggplot2::ggplot(
      data = data_curve,
      mapping = ggplot2::aes(x = pocet, y = se)
    ) +
    ggplot2::labs(
      x = "Počet erupcí",
      y = "SE sklonu podle vzorce"
    ) +
    theme_biostat(base_size = base_size) +
    ggplot2::geom_line(
      color = biostat_cols[["orange"]],
      linewidth = 1.6
    ) +
    ggplot2::geom_point(
      data = dplyr::slice_head(data_points, n = n_points),
      color = biostat_cols[["graphite"]],
      size = 4.5
    ) +
    ggplot2::geom_label(
      data = dplyr::slice_head(data_points, n = n_points),
      mapping = ggplot2::aes(label = text),
      hjust = "inward",
      vjust = -1,
      size = 6.5,
      color = biostat_cols[["graphite"]],
      fill = scales::alpha(biostat_cols[["white"]], 0.8),
      label.size = 0
    ) +
    ggplot2::scale_y_continuous(
      limits = c(0, NA),
      expand = ggplot2::expansion(mult = c(0, 0.1))
    )

  return(res_plot)
}
