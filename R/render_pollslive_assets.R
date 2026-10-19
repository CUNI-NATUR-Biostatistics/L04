#----------------------------------------------------------#
#
#
#             CUNI-NATUR-Biostatistics L04
#
#          Render PollsLive retrieval evidence
#               - the quiz retrieves L03
#
#                    Ondřej Mottl
#                        2026
#
#----------------------------------------------------------#

# Reproducible source of the evidence images. Local PollsLive preparation
#   runs R/verify_pollslive_assets.R, which checks the approved bytes.

here::i_am("R/render_pollslive_assets.R")

source(here::here("R", "set_r_theme.R"))
# Pixel canvases use 150 DPI; match showtext font metrics to the save device.
showtext::showtext_opts(dpi = 150)
source(here::here("R", "save_local_figure.R"))

path_assets <-
  here::here("pollslive", "assets")

path_l03_residuals <-
  here::here(
    "..", "L03", "Presentation", "Materials", "rezidua_podle_druhu.png"
  )

barvy <-
  c(
    data = biostat_cols[["grey_olive"]],
    model = biostat_cols[["indigo_velvet"]],
    interpretace = biostat_cols[["orange"]]
  )


#----------------------------------------------------------#
# 1. Fit the L03 model -----
#----------------------------------------------------------#

# The built-in iris measurements are the L03 data/kosatce.csv values.
data_kosatce <-
  data.frame(
    sirka_listku = datasets::iris[["Petal.Width"]],
    delka_listku = datasets::iris[["Petal.Length"]]
  )

mod_listky <-
  stats::lm(
    formula = delka_listku ~ sirka_listku,
    data = data_kosatce
  )

stopifnot(
  identical(base::round(stats::coef(mod_listky)[["sirka_listku"]], 2), 2.23),
  identical(base::round(stats::coef(mod_listky)[["(Intercept)"]], 2), 1.08)
)


#----------------------------------------------------------#
# 2. Q1: coefficients as printed by R -----
#----------------------------------------------------------#

vec_coef_lines <-
  utils::capture.output(
    base::print(base::round(stats::coef(mod_listky), 2))
  )

plot_coef <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0, 1)
  ) +
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    )
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.08,
    y = 0.72,
    label = "> coef(mod_listky)",
    hjust = 0,
    family = biostat_mono_font,
    size = 11,
    colour = barvy[["data"]]
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.08,
    y = c(0.5, 0.3),
    label = vec_coef_lines,
    hjust = 0,
    family = biostat_mono_font,
    size = 11,
    colour = biostat_cols[["graphite"]]
  )

save_local_figure(
  plot = plot_coef,
  filename = "l03-coef-listky.png",
  width = 1600,
  height = 500,
  path = here::here(path_assets, "l03-coef-listky.png")
)


#----------------------------------------------------------#
# 3. Q2: residuals by species, copied from L03 -----
#----------------------------------------------------------#

# The familiar L03 figure is copied byte for byte; its checksum is pinned
#   in R/verify_pollslive_assets.R.
if (
  base::file.exists(path_l03_residuals)
) {
  res_copy <-
    base::file.copy(
      from = path_l03_residuals,
      to = here::here(path_assets, "l03-rezidua-podle-druhu.png"),
      overwrite = TRUE
    )
}


#----------------------------------------------------------#
# 4. Q3: residuals of four flowers for two lines -----
#----------------------------------------------------------#

# Teaching numbers: the first line has residuals summing to zero but a large
#   sum of squares; the second has a non-zero sum but a much smaller one.
data_dve_primky <-
  data.frame(
    primka = c("První přímka", "Druhá přímka"),
    y = c(2, 1),
    kvet_1 = c(0.5, 0.2),
    kvet_2 = c(-0.5, -0.1),
    kvet_3 = c(0.5, 0.2),
    kvet_4 = c(-0.5, -0.1)
  )

mat_residua <-
  base::as.matrix(data_dve_primky[, c("kvet_1", "kvet_2", "kvet_3", "kvet_4")])

stopifnot(
  base::isTRUE(base::all.equal(base::rowSums(mat_residua), c(0, 0.2))),
  base::isTRUE(base::all.equal(base::rowSums(mat_residua^2), c(1, 0.1)))
)

format_residuum <- function(x) {
  res_text <-
    stringr::str_replace(
      base::formatC(x, format = "f", digits = 1, decimal.mark = ",", flag = "+"),
      pattern = "^-",
      replacement = "−"
    )

  return(res_text)
}

data_bunky <-
  data.frame(
    x = base::rep(c(0.45, 0.6, 0.75, 0.9), each = 2),
    y = base::rep(data_dve_primky[["y"]], times = 4),
    label = format_residuum(base::as.vector(mat_residua))
  )

plot_dve_primky <-
  ggplot2::ggplot() +
  ggplot2::coord_cartesian(
    xlim = c(0, 1),
    ylim = c(0.5, 3.5)
  ) +
  ggplot2::theme_void() +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = biostat_cols[["white"]],
      colour = NA
    )
  ) +
  ggplot2::annotate(
    geom = "text",
    x = c(0.05, 0.45, 0.6, 0.75, 0.9),
    y = 3,
    label = c("Residua (cm)", "květ 1", "květ 2", "květ 3", "květ 4"),
    hjust = c(0, 0.5, 0.5, 0.5, 0.5),
    family = biostat_base_font,
    fontface = "bold",
    size = 8,
    colour = barvy[["model"]]
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.05,
    y = data_dve_primky[["y"]],
    label = data_dve_primky[["primka"]],
    hjust = 0,
    family = biostat_base_font,
    size = 8,
    colour = biostat_cols[["graphite"]]
  ) +
  ggplot2::geom_text(
    data = data_bunky,
    mapping = ggplot2::aes(
      x = x,
      y = y,
      label = label
    ),
    family = biostat_mono_font,
    size = 8,
    colour = biostat_cols[["graphite"]]
  )

save_local_figure(
  plot = plot_dve_primky,
  filename = "l03-dve-primky-residua.png",
  width = 1600,
  height = 450,
  path = here::here(path_assets, "l03-dve-primky-residua.png")
)
