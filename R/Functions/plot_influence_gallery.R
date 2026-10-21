# CUNI-NATUR-Biostatistics L04 — leverage, residual and influence, 2026.
# Plot influence gallery -----
# Draws the 2 x 2 gallery from `simulate_influence_gallery()`: base points in
#   grey, the added point in orange, the line fitted with the added point
#   (solid purple) and without it (dashed graphite). Panel titles give the
#   leverage and Cook's distance of the added point. Uses the course theme
#   objects `biostat_cols` and `theme_biostat()` from `R/set_r_theme.R`.
plot_influence_gallery <- function(list_gallery, base_size = 13) {
  data_titles <-
    list_gallery$data_panels |>
    dplyr::mutate(
      titulek = paste0(
        paka, ", ", residuum,
        "\npákový efekt ", format_cz(pakovy_efekt, digits = 2),
        ", Cookova vzdálenost ", format_cz(cookova_vzdalenost, digits = 3)
      )
    ) |>
    dplyr::select(panel_id, titulek)

  vec_titles <-
    rlang::set_names(
      data_titles$titulek,
      data_titles$panel_id
    )

  # No band: simulated illustration with two lines per panel.
  res_plot <-
    ggplot2::ggplot() +
    ggplot2::facet_wrap(
      facets = ggplot2::vars(panel_id),
      ncol = 2,
      labeller = ggplot2::as_labeller(vec_titles)
    ) +
    ggplot2::scale_linetype_manual(
      values = c("s bodem" = "solid", "bez bodu" = "dashed"),
      name = NULL
    ) +
    ggplot2::scale_color_manual(
      values = c(
        "s bodem" = biostat_cols[["indigo_velvet"]],
        "bez bodu" = biostat_cols[["graphite"]]
      ),
      name = NULL
    ) +
    ggplot2::labs(
      x = "x",
      y = "y"
    ) +
    theme_biostat(base_size = base_size) +
    ggplot2::theme(
      legend.position = "top"
    ) +
    ggplot2::geom_segment(
      data = list_gallery$data_lines,
      mapping = ggplot2::aes(
        x = x,
        xend = xend,
        y = y,
        yend = yend,
        linetype = primka,
        color = primka
      ),
      linewidth = 1
    ) +
    ggplot2::geom_point(
      data = dplyr::filter(list_gallery$data_points, !pridany),
      mapping = ggplot2::aes(x = x, y = y),
      color = biostat_cols[["grey_olive"]],
      size = 2
    ) +
    ggplot2::geom_point(
      data = dplyr::filter(list_gallery$data_points, pridany),
      mapping = ggplot2::aes(x = x, y = y),
      color = biostat_cols[["orange"]],
      size = 3.5
    )

  return(res_plot)
}
