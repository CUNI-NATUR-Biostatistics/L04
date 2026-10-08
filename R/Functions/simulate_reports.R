# CUNI-NATUR-Biostatistics L04 — simulated GeyserWatch reports, 2026.
# Simulate reports -----
# Each report draws `n_eruptions` different eruption lengths from the observed
#   data. Its waiting times are generated from the line fitted to all
#   eruptions plus normal departures with the model's residual standard
#   deviation. The fitted slope is therefore the known reference value of the
#   demonstration, not the unknown population slope. Set the seed before use.
simulate_reports <- function(data_source, mod_reference, n_reports, n_eruptions) {
  intercept_reference <-
    stats::coef(mod_reference)[["(Intercept)"]]

  slope_reference <-
    stats::coef(mod_reference)[["delka_erupce_min"]]

  sd_departures <-
    stats::sigma(mod_reference)

  res_reports <-
    seq_len(n_reports) |>
    purrr::map(
      .f = ~ {
        vec_delky <-
          data_source$delka_erupce_min[
            sample(
              x = nrow(data_source),
              size = n_eruptions,
              replace = FALSE
            )
          ]

        tibble::tibble(
          hlaseni = .x,
          delka_erupce_min = vec_delky,
          cekani_min = intercept_reference +
            slope_reference * vec_delky +
            stats::rnorm(
              n = n_eruptions,
              mean = 0,
              sd = sd_departures
            )
        )
      }
    ) |>
    purrr::list_rbind()

  return(res_reports)
}
