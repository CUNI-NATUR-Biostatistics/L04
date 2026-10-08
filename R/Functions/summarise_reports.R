# CUNI-NATUR-Biostatistics L04 — one model per simulated report, 2026.
# Summarise reports -----
# Fits the lesson model to every report and returns its intercept, slope,
#   standard error and confidence limits for each requested level.
summarise_reports <- function(data_reports, vec_levels) {
  res_summary <-
    data_reports |>
    dplyr::group_by(hlaseni) |>
    tidyr::nest() |>
    dplyr::ungroup() |>
    dplyr::mutate(
      model = purrr::map(
        .x = data,
        .f = ~ stats::lm(
          formula = cekani_min ~ delka_erupce_min,
          data = .x
        )
      ),
      intercept = purrr::map_dbl(
        .x = model,
        .f = ~ stats::coef(.x)[["(Intercept)"]]
      ),
      odhad_sklonu = purrr::map_dbl(
        .x = model,
        .f = ~ stats::coef(.x)[["delka_erupce_min"]]
      ),
      se_sklonu = purrr::map_dbl(
        .x = model,
        .f = ~ summary(.x)$coefficients[
          "delka_erupce_min",
          "Std. Error"
        ]
      ),
      intervaly = purrr::map(
        .x = model,
        .f = ~ purrr::map(
          .x = vec_levels,
          .f = function(level) {
            table_interval <-
              stats::confint(
                object = .x,
                parm = "delka_erupce_min",
                level = level
              )

            tibble::tibble(
              hladina = level,
              dolni_mez = table_interval[1, 1],
              horni_mez = table_interval[1, 2]
            )
          }
        ) |>
          purrr::list_rbind()
      )
    ) |>
    dplyr::select(-data, -model)

  return(res_summary)
}
