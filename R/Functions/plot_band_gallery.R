# CUNI-NATUR-Biostatistics L04 — when is the confidence band wide, 2026.
# Plot band gallery -----
# Draws the 2 x 2 gallery from `simulate_band_gallery()`: simulated points in
#   grey, the fitted line (purple) with its 95% confidence band, and the true
#   line of the simulation (dashed graphite). All panels share the axes so
#   band widths can be compared directly; the band is clipped at `ylim`.
#   Panel titles give the band width at `x_width_check`. Uses the course
#   theme objects `biostat_cols` and `theme_biostat()` from `R/set_r_theme.R`.
plot_band_gallery <- function(
    list_gallery,
    ylim = c(-4, 18),
    base_size = 13) {
  data_titles <-
    list_gallery$data_panels |>
    dplyr::mutate(
      titulek = paste0(
        panel_id, ": ", popis,
        "\nšířka pásu u x = ", list_gallery$x_width_check, ": ",
        format_cz(sirka_pasu, digits = 1)
      )
    )

  vec_titles <-
    rlang::set_names(
      data_titles$titulek,
      data_titles$panel_id
    )

  res_plot <-
    ggplot2::ggplot() +
    ggplot2::facet_wrap(
      facets = ggplot2::vars(panel_id),
      ncol = 2,
      labeller = ggplot2::as_labeller(vec_titles)
    ) +
    ggplot2::coord_cartesian(
      ylim = ylim,
      expand = FALSE
    ) +
    ggplot2::scale_x_continuous(
      breaks = c(0, 5, 10)
    ) +
    ggplot2::scale_y_continuous(
      breaks = c(0, 10, 20)
    ) +
    ggplot2::scale_linetype_manual(
      values = c(
        "odhadnutá přímka a pás" = "solid",
        "skutečný trend simulace" = "dashed"
      ),
      name = NULL
    ) +
    ggplot2::scale_color_manual(
      values = c(
        "odhadnutá přímka a pás" = biostat_cols[["indigo_velvet"]],
        "skutečný trend simulace" = biostat_cols[["graphite"]]
      ),
      name = NULL
    ) +
    ggplot2::labs(
      x = "x",
      y = "y"
    ) +
    theme_biostat(base_size = base_size) +
    ggplot2::theme(
      legend.position = "top",
      legend.key.width = ggplot2::unit(2.5, "lines"),
      panel.spacing.x = ggplot2::unit(1.5, "lines")
    ) +
    ggplot2::geom_ribbon(
      data = list_gallery$data_band,
      mapping = ggplot2::aes(x = x, ymin = lwr, ymax = upr),
      fill = biostat_cols[["amethyst"]],
      alpha = 0.3
    ) +
    ggplot2::geom_point(
      data = list_gallery$data_points,
      mapping = ggplot2::aes(x = x, y = y),
      color = biostat_cols[["grey_olive"]],
      alpha = 0.8,
      size = 1.8
    ) +
    ggplot2::geom_line(
      data = list_gallery$data_band,
      mapping = ggplot2::aes(
        x = x,
        y = y_true,
        linetype = "skutečný trend simulace",
        color = "skutečný trend simulace"
      ),
      linewidth = 0.8
    ) +
    ggplot2::geom_line(
      data = list_gallery$data_band,
      mapping = ggplot2::aes(
        x = x,
        y = fit,
        linetype = "odhadnutá přímka a pás",
        color = "odhadnutá přímka a pás"
      ),
      linewidth = 1.2
    )

  return(res_plot)
}
