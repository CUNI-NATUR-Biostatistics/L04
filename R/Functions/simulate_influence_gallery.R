# CUNI-NATUR-Biostatistics L04 — leverage, residual and influence, 2026.
# Simulate influence gallery -----
# Generic simulated data for a 2 x 2 gallery: the same base points plus one
#   added point that has a small or large residual and a small or large
#   leverage. For every panel the line is fitted with and without the added
#   point, and the leverage and Cook's distance of the added point are
#   reported. Values are illustrative, not lesson data.
# Returns a named list: `data_points` (base and added points per panel),
#   `data_lines` (two lines per panel) and `data_panels` (one row per panel
#   with its label, leverage and Cook's distance).
simulate_influence_gallery <- function(
    n_points = 20L,
    residual_large = 6,
    residual_small = 0.4,
    x_far = 14,
    seed = 900723) {
  set.seed(seed)

  data_base <-
    tibble::tibble(
      x = stats::runif(n = n_points, min = 1, max = 7),
      y = 2 + 1 * x + stats::rnorm(n = n_points, mean = 0, sd = 1)
    )

  mod_base <-
    stats::lm(formula = y ~ x, data = data_base)

  x_mean <-
    mean(data_base$x)

  # Added point placed relative to the line fitted to the base points
  data_settings <-
    tibble::tibble(
      panel_id = 1:4,
      paka = c("malá páka", "malá páka", "velká páka", "velká páka"),
      residuum = c(
        "malé residuum", "velké residuum", "malé residuum", "velké residuum"
      ),
      x = c(x_mean, x_mean, x_far, x_far),
      odchylka = c(
        residual_small, residual_large, residual_small, -residual_large
      )
    ) |>
    dplyr::mutate(
      y = stats::predict(
        object = mod_base,
        newdata = data.frame(x = x)
      ) + odchylka
    )

  list_panels <-
    data_settings |>
    split(f = data_settings$panel_id) |>
    purrr::map(
      .f = ~ {
        data_with <-
          dplyr::bind_rows(
            data_base,
            dplyr::select(.x, x, y)
          )

        mod_with <-
          stats::lm(formula = y ~ x, data = data_with)

        index_added <-
          nrow(data_with)

        tibble::tibble(
          panel_id = .x$panel_id,
          paka = .x$paka,
          residuum = .x$residuum,
          x_added = .x$x,
          y_added = .x$y,
          pakovy_efekt = stats::hatvalues(model = mod_with)[[index_added]],
          cookova_vzdalenost = stats::cooks.distance(model = mod_with)[[
            index_added
          ]],
          intercept_with = stats::coef(mod_with)[["(Intercept)"]],
          slope_with = stats::coef(mod_with)[["x"]],
          intercept_without = stats::coef(mod_base)[["(Intercept)"]],
          slope_without = stats::coef(mod_base)[["x"]]
        )
      }
    ) |>
    purrr::list_rbind()

  vec_x_range <-
    c(0, x_far + 1)

  data_lines <-
    list_panels |>
    dplyr::select(
      panel_id, intercept_with, slope_with, intercept_without, slope_without
    ) |>
    tidyr::pivot_longer(
      cols = -panel_id,
      names_to = c(".value", "primka"),
      names_pattern = "(intercept|slope)_(with|without)$"
    ) |>
    dplyr::mutate(
      primka = dplyr::if_else(primka == "with", "s bodem", "bez bodu"),
      x = vec_x_range[1],
      xend = vec_x_range[2],
      y = intercept + slope * x,
      yend = intercept + slope * xend
    )

  data_points <-
    list_panels |>
    dplyr::select(panel_id) |>
    dplyr::cross_join(data_base) |>
    dplyr::mutate(pridany = FALSE) |>
    dplyr::bind_rows(
      list_panels |>
        dplyr::mutate(x = x_added, y = y_added, pridany = TRUE) |>
        dplyr::select(panel_id, x, y, pridany)
    )

  data_panels <-
    list_panels |>
    dplyr::select(panel_id, paka, residuum, pakovy_efekt, cookova_vzdalenost)

  res_gallery <-
    list(
      data_points = data_points,
      data_lines = data_lines,
      data_panels = data_panels
    )

  return(res_gallery)
}
