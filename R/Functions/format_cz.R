# CUNI-NATUR-Biostatistics L04 — Czech explanatory numbers, 2026.
# Format numbers -----
# Raw R output is unchanged.
format_cz <- function(x, digits = 2) {
  format(
    x = round(x = x, digits = digits),
    trim = TRUE,
    decimal.mark = ",",
    scientific = FALSE
  )
}
