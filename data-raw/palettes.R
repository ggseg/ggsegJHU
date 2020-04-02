devtools::load_all("../../ggsegExtra/")
devtools::load_all(".")

# Make palette
brain_pals <- make_palette_ggseg(jhu_3d)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# fix atlas
jhu_n <- mutate(jhu,
                 kp = case_when(
                   grepl("Left", label) & hemi != "left" ~  FALSE,
                   grepl("Right", label) & hemi != "right" ~ FALSE,
                   TRUE ~ TRUE)) %>%
  filter(kp) %>%
  select(-kp)
jhu_n <- unnest(jhu_n, ggseg)
jhu_n <- group_by(jhu_n, label, hemi,  side, region, .id)
jhu_n <- nest(jhu_n)
jhu_n <- group_by(jhu_n, hemi,  side, region)
jhu_n <- mutate(jhu_n, .subid = row_number())
jhu_n <- unnest(jhu_n, data)
jhu_n <- ungroup(jhu_n)
jhu_n <- mutate(jhu_n,
                region = as.character(region),
                region = ifelse(grepl("fluid", region), NA, region))
jhu_n <- as_ggseg_atlas(jhu_n)

jhu_n %>%
  ggseg(atlas = ., show.legend = TRUE,
        colour = "black",
        mapping = aes(fill=region)) +
  scale_fill_brain("jhu", package = "ggsegJHU")


jhu <- jhu_n
usethis::use_data(jhu,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")

# devtools::load_all("../../ggsegExtra/")
# jhu_3d <- ggsegExtra:::restruct_old_3datlas(jhu_3d)
# jhu_3d <- as_ggseg3d_atlas(jhu_3d)
# usethis::use_data(jhu_3d, internal = FALSE, overwrite = TRUE)
