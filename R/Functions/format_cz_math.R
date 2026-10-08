# CUNI-NATUR-Biostatistics L04 — Czech numbers inside display maths, 2026.
# Format numbers for LaTeX -----
# In maths mode a comma is punctuation and gets a trailing space ("1, 1"),
#   in both MathJax (HTML) and Typst (PDF). Wrapping the whole number in
#   \text{} keeps the decimal comma tight; a true minus sign replaces "-".
format_cz_math <- function(x, digits = 2, nsmall = 0) {
  res_text <-
    format(
      x = round(x = x, digits = digits),
      nsmall = nsmall,
      trim = TRUE,
      decimal.mark = ",",
      scientific = FALSE
    )

  res_text <-
    sub(pattern = "^-", replacement = "−", x = res_text)

  return(paste0("\\text{", res_text, "}"))
}
