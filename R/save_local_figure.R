#----------------------------------------------------------#
#
#
#             CUNI-NATUR-Biostatistics L04
#
#                 Save local figure
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Save figure -----
#----------------------------------------------------------#

save_local_figure <- function(
  plot,
  filename,
  width = 1600,
  height = 800,
  path = here::here(path_materials, filename)
) {
  # Axis labels are formatted while saving; Czech decimal commas apply only
  #   to the saved figure, not to printed R output shown on slides.
  options_previous <- options(OutDec = ",")
  on.exit(options(options_previous), add = TRUE)

  plot_canvas <-
    plot +
    ggview::canvas(
      width = width,
      height = height,
      units = "px",
      dpi = 150
    )

  res_file <-
    ggview::save_ggplot(
      plot = plot_canvas,
      file = path
    )

  return(invisible(res_file))
}
