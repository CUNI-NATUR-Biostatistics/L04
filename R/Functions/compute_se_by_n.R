# CUNI-NATUR-Biostatistics L04 — slope SE for other numbers of eruptions, 2026.
# Compute SE by n -----
# Standard error of the slope from the formula
#   SE = residual SD / (SD of the predictor * sqrt(n - 1)),
#   keeping the residual SD and the predictor spread of `mod_reference` and
#   changing only the number of observations `vec_n`.
compute_se_by_n <- function(mod_reference, vec_predictor, vec_n) {
  res_se <-
    stats::sigma(object = mod_reference) /
    (stats::sd(vec_predictor) * sqrt(vec_n - 1))

  return(res_se)
}
