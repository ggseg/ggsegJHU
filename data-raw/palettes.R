library(dplyr)

# Make palette
k <- dplyr::slice(jhu_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!grepl("wall", region))

brain_pals = list(
  jhu = setNames(k$colour, k$region)
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)

devtools::load_all("../../ggsegExtra/")
jhu_3d <- ggsegExtra:::restruct_old_3datlas(jhu_3d)
jhu_3d <- as_ggseg3d_atlas(jhu_3d)
usethis::use_data(jhu_3d, internal = FALSE, overwrite = TRUE)
