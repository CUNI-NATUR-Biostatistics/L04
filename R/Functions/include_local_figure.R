# CUNI-NATUR-Biostatistics L04 — local presentation assets, 2026.
# Include figure -----
# The presentation knits from the project root (visible code reads data/...),
#   so keep the absolute path instead of letting knitr relativise it.
include_local_figure <- function(data_source) {
  knitr::include_graphics(
    path = here::here(path_materials, data_source),
    rel_path = FALSE,
    error = TRUE
  )
}
