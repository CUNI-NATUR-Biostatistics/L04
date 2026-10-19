#----------------------------------------------------------#
# Verify approved local evidence for the L04 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l03-coef-listky.png" =
      "ab706c47351121c6287f619bf530fece376b448d84ccf5e10292d1bc6a17d1bb",
    # Byte-identical copy of L03 Presentation/Materials/rezidua_podle_druhu.png
    "l03-rezidua-podle-druhu.png" =
      "e7b17466d25cd40e6daeeee6a49d96a5300e6622a0b0b7f847c4aef8c2818474",
    "l03-dve-primky-residua.png" =
      "8d89bb98674a75ea16294df284377bc7e5b0e357b0be4fc611cd45404c853559"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
