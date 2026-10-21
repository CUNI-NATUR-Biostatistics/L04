# CUNI-NATUR-Biostatistics L04 — what makes a slope steadier, 2026.
# Plot stability pairs -----
# Draws the six panels of the stability comparison (one comparison per
#   column with n_col = 3, per row with n_col = 2; options A and B are the
#   other direction). Only comparisons up to `max_pair` are filled;
#   later ones stay as empty panels so the layout does not jump between
#   fragments. Each filled panel gets an inset histogram of its report
#   slopes in the bottom-right corner; all insets share the same bins and
#   count scale, so their widths can be compared directly. Uses
#   `biostat_cols` and `theme_biostat()` from `R/set_r_theme.R`. `n_col` sets
#   the facet columns; `show_sd_label = FALSE` drops the in-panel SD label
#   when the panel titles already carry it.
plot_stability_pairs <- function(
    data_points,
    data_lines,
    data_panels,
    max_pair,
    xlim,
    ylim,
    base_size = 17,
    n_col = 3,
    show_sd_label = TRUE,
    n_bins = 20) {
  # Inset position in data coordinates of each panel (bottom-right corner)
  width_x <- diff(xlim)
  height_y <- diff(ylim)
  inset_x <- c(xlim[1] + 0.52 * width_x, xlim[2] - 0.02 * width_x)
  inset_y <- c(ylim[1] + 0.03 * height_y, ylim[1] + 0.33 * height_y)

  # Common bins and count scale across all panels
  vec_breaks <-
    seq(
      from = min(data_lines$odhad_sklonu),
      to = max(data_lines$odhad_sklonu),
      length.out = n_bins + 1
    )

  data_inset_bars <-
    data_lines |>
    dplyr::mutate(
      bin = cut(
        x = odhad_sklonu,
        breaks = vec_breaks,
        include.lowest = TRUE,
        labels = FALSE
      )
    ) |>
    dplyr::count(panel, dvojice, bin, name = "pocet")

  max_count <-
    max(data_inset_bars$pocet)

  data_inset_bars <-
    data_inset_bars |>
    dplyr::mutate(
      xmin = inset_x[1] + (bin - 1) / n_bins * diff(inset_x),
      xmax = inset_x[1] + bin / n_bins * diff(inset_x),
      ymin = inset_y[1],
      ymax = inset_y[1] + pocet / max_count * diff(inset_y) * 0.9
    )

  data_inset_box <-
    data_panels |>
    dplyr::select(panel, dvojice) |>
    dplyr::mutate(
      xmin = inset_x[1],
      xmax = inset_x[2],
      ymin = inset_y[1],
      ymax = inset_y[2]
    )

  res_plot <-
    ggplot2::ggplot() +
    ggplot2::facet_wrap(
      facets = ggplot2::vars(panel),
      ncol = n_col,
      drop = FALSE
    ) +
    ggplot2::coord_cartesian(
      xlim = xlim,
      ylim = ylim
    ) +
    ggplot2::labs(
      x = "Délka erupce (min)",
      y = "Čekání (min)"
    ) +
    theme_biostat(base_size = base_size) +
    ggplot2::geom_point(
      data = dplyr::filter(data_points, dvojice <= max_pair),
      mapping = ggplot2::aes(x = delka_erupce_min, y = cekani_min),
      color = biostat_cols[["grey_olive"]],
      alpha = 0.7,
      size = 1.4
    ) +
    # No band: simulated report lines, not a fitted model of the lesson data.
    ggplot2::geom_segment(
      data = dplyr::filter(data_lines, dvojice <= max_pair),
      mapping = ggplot2::aes(
        x = x_od,
        xend = x_do,
        y = y,
        yend = yend,
        group = hlaseni
      ),
      color = biostat_cols[["indigo_velvet"]],
      alpha = 0.2,
      linewidth = 0.5
    ) +
    ggplot2::geom_rect(
      data = dplyr::filter(data_inset_box, dvojice <= max_pair),
      mapping = ggplot2::aes(
        xmin = xmin,
        xmax = xmax,
        ymin = ymin,
        ymax = ymax
      ),
      fill = biostat_cols[["white"]],
      color = biostat_cols[["grey_olive"]],
      linewidth = 0.3
    ) +
    ggplot2::geom_rect(
      data = dplyr::filter(data_inset_bars, dvojice <= max_pair),
      mapping = ggplot2::aes(
        xmin = xmin,
        xmax = xmax,
        ymin = ymin,
        ymax = ymax
      ),
      fill = biostat_cols[["amethyst"]],
      color = biostat_cols[["white"]],
      linewidth = 0.2
    )

  if (
    !show_sd_label
  ) {
    return(res_plot)
  }

  res_plot <-
    res_plot +
    ggplot2::geom_label(
      data = dplyr::filter(data_panels, dvojice <= max_pair),
      mapping = ggplot2::aes(label = text_sd),
      x = -Inf,
      y = Inf,
      hjust = -0.05,
      vjust = 1.2,
      size = 5.5,
      color = biostat_cols[["orange"]],
      fill = biostat_cols[["white"]],
      fontface = "bold",
      label.size = 0
    )

  return(res_plot)
}
