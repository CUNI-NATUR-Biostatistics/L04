# CUNI-NATUR-Biostatistics L04 — repeated-interval coverage figure, 2026.
# Plot coverage -----
# One horizontal interval per simulated report at the chosen level. Intervals
#   that contain the reference slope use the model colour, misses are grey and
#   the reference slope is a dark context line. Axes stay fixed across levels.
plot_coverage <- function(data_coverage, level, slope_reference, xlim) {
  data_level <-
    data_coverage |>
    dplyr::filter(hladina == level)

  res_plot <-
    ggplot2::ggplot(
      data = data_level,
      mapping = ggplot2::aes(
        y = hlaseni,
        x = odhad_sklonu,
        xmin = dolni_mez,
        xmax = horni_mez,
        color = vysledek,
        linetype = vysledek
      )
    ) +
    ggplot2::geom_errorbarh(
      height = 0,
      linewidth = 1.1,
      alpha = 0.9
    ) +
    ggplot2::geom_point(size = 1.6) +
    ggplot2::geom_vline(
      xintercept = slope_reference,
      color = biostat_cols[["graphite"]],
      linewidth = 1.3
    ) +
    ggplot2::scale_color_manual(
      values = c(
        "Zachytil referenční sklon" = biostat_cols[["amethyst"]],
        "Minul referenční sklon" = biostat_cols[["grey_olive"]]
      ),
      breaks = c(
        "Zachytil referenční sklon",
        "Minul referenční sklon"
      )
    ) +
    # Line type repeats the hit/miss distinction so colour is not the only cue.
    ggplot2::scale_linetype_manual(
      values = c(
        "Zachytil referenční sklon" = "solid",
        "Minul referenční sklon" = "22"
      ),
      breaks = c(
        "Zachytil referenční sklon",
        "Minul referenční sklon"
      )
    ) +
    ggplot2::coord_cartesian(xlim = xlim) +
    ggplot2::scale_y_continuous(
      limits = c(0, max(data_level$hlaseni) + 1),
      expand = ggplot2::expansion(mult = c(0, 0))
    ) +
    ggplot2::labs(
      x = "Sklon (min čekání / min erupce); tmavá čára = referenční sklon",
      y = NULL,
      color = NULL,
      linetype = NULL
    ) +
    theme_biostat(base_size = 18) +
    ggplot2::theme(
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      legend.position = "bottom"
    )

  return(res_plot)
}
