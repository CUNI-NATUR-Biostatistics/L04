# CUNI-NATUR-Biostatistics L04 — what makes a slope steadier, 2026.
# Simulate stability pairs -----
# Simulates GeyserWatch-style report sets in four settings. Each setting
#   changes one ingredient of the slope's standard error against the
#   GeyserWatch setting: residual scatter (doubled), spread of eruption
#   lengths (only eruptions of at least `min_length_long` minutes) or the
#   number of eruptions (`n_eruptions_small`). Every setting starts from the
#   lesson seed, so the GeyserWatch setting reproduces the reports of the
#   GeyserWatch section exactly.
# Returns a named list: `data_lines` (one row per report with its intercept,
#   slope and the length range to draw its line over) and `data_points` (the
#   eruptions of the first report in every setting).
simulate_stability_pairs <- function(
    data_source,
    mod_reference,
    n_reports,
    n_eruptions,
    n_eruptions_small,
    min_length_long,
    seed = 900723) {
  data_long <-
    data_source |>
    dplyr::filter(delka_erupce_min >= min_length_long)

  list_settings <-
    list(
      geyserwatch = list(
        data_source = data_source,
        n_eruptions = n_eruptions,
        sd_departures = stats::sigma(mod_reference)
      ),
      scatter_double = list(
        data_source = data_source,
        n_eruptions = n_eruptions,
        sd_departures = 2 * stats::sigma(mod_reference)
      ),
      lengths_long = list(
        data_source = data_long,
        n_eruptions = n_eruptions,
        sd_departures = stats::sigma(mod_reference)
      ),
      eruptions_few = list(
        data_source = data_source,
        n_eruptions = n_eruptions_small,
        sd_departures = stats::sigma(mod_reference)
      )
    )

  list_reports <-
    list_settings |>
    purrr::map(
      .f = ~ {
        set.seed(seed)

        simulate_reports(
          data_source = .x$data_source,
          mod_reference = mod_reference,
          n_reports = n_reports,
          n_eruptions = .x$n_eruptions,
          sd_departures = .x$sd_departures
        )
      }
    )

  data_lines <-
    list_reports |>
    purrr::imap(
      .f = ~ {
        vec_range <-
          range(list_settings[[.y]]$data_source$delka_erupce_min)

        summarise_reports(
          data_reports = .x,
          vec_levels = 0.95
        ) |>
          dplyr::select(hlaseni, intercept, odhad_sklonu) |>
          dplyr::mutate(
            nastaveni = .y,
            x_od = vec_range[1],
            x_do = vec_range[2]
          )
      }
    ) |>
    purrr::list_rbind()

  data_points <-
    list_reports |>
    purrr::imap(
      .f = ~ .x |>
        dplyr::filter(hlaseni == 1) |>
        dplyr::mutate(nastaveni = .y)
    ) |>
    purrr::list_rbind()

  res_pairs <-
    list(
      data_lines = data_lines,
      data_points = data_points
    )

  return(res_pairs)
}
