# CUNI-NATUR-Biostatistics L04 — when is the confidence band wide, 2026.
# Simulate band gallery -----
# Generic simulated data for a 2 x 2 gallery of confidence bands. All panels
#   share the same true line; they differ in the residual spread, the number
#   of points or the range of x. For every panel a line is fitted and its
#   95% confidence band is computed over the whole drawn x range, also
#   outside the data. Values are illustrative, not lesson data.
# Returns a named list: `data_points` (simulated points per panel),
#   `data_band` (fitted line and band hranice on a grid of x per panel) and
#   `data_panels` (one row per panel with its label and band widths).
simulate_band_gallery <- function(
    n_points = 40L,
    n_points_few = 5L,
    sd_small = 1,
    sd_large = 4,
    x_range_full = c(1, 9),
    x_range_narrow = c(4.5, 5.5),
    x_drawn = c(0, 10),
    x_width_check = 9,
    seed = 900723) {
  set.seed(seed)

  intercept_true <- 2
  slope_true <- 1

  data_settings <-
    tibble::tibble(
      panel_id = 1:4,
      popis = c(
        "mnoho bodů, malý rozptyl",
        "velký rozptyl kolem přímky",
        paste0("jen ", n_points_few, " bodů"),
        paste0(
          "úzký rozsah x (",
          format(x_range_narrow[1], decimal.mark = ","),
          " až ",
          format(x_range_narrow[2], decimal.mark = ","),
          ")"
        )
      ),
      n = c(n_points, n_points, n_points_few, n_points),
      sd_residual = c(sd_small, sd_large, sd_small, sd_small),
      x_min = c(
        x_range_full[1], x_range_full[1], x_range_full[1], x_range_narrow[1]
      ),
      x_max = c(
        x_range_full[2], x_range_full[2], x_range_full[2], x_range_narrow[2]
      )
    )

  vec_x_grid <-
    seq(from = x_drawn[1], to = x_drawn[2], length.out = 101)

  list_panels <-
    data_settings |>
    split(f = data_settings$panel_id) |>
    purrr::map(
      .f = ~ {
        data_sim <-
          tibble::tibble(
            panel_id = .x$panel_id,
            x = stats::runif(n = .x$n, min = .x$x_min, max = .x$x_max),
            y = intercept_true + slope_true * x +
              stats::rnorm(n = .x$n, mean = 0, sd = .x$sd_residual)
          )

        mod_sim <-
          stats::lm(formula = y ~ x, data = data_sim)

        mat_band <-
          stats::predict(
            object = mod_sim,
            newdata = data.frame(x = c(vec_x_grid, x_width_check)),
            interval = "confidence"
          )

        index_check <-
          nrow(mat_band)

        data_band <-
          tibble::tibble(
            panel_id = .x$panel_id,
            x = vec_x_grid,
            fit = mat_band[-index_check, "fit"],
            lwr = mat_band[-index_check, "lwr"],
            upr = mat_band[-index_check, "upr"],
            y_true = intercept_true + slope_true * vec_x_grid
          )

        data_panel <-
          tibble::tibble(
            panel_id = .x$panel_id,
            popis = .x$popis,
            sirka_pasu = mat_band[index_check, "upr"] -
              mat_band[index_check, "lwr"]
          )

        list(
          data_points = data_sim,
          data_band = data_band,
          data_panel = data_panel
        )
      }
    )

  res_gallery <-
    list(
      data_points = purrr::map(list_panels, "data_points") |>
        purrr::list_rbind(),
      data_band = purrr::map(list_panels, "data_band") |>
        purrr::list_rbind(),
      data_panels = purrr::map(list_panels, "data_panel") |>
        purrr::list_rbind(),
      x_width_check = x_width_check
    )

  return(res_gallery)
}
