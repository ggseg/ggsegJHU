# ggseg ----
context("test-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("jhu", package = "ggsegJHU")), 11)

  expect_error(brain_pal("jhu"), "not a valid")

  expect_true(all(names(brain_pal("jhu", package = "ggsegJHU")) %in% brain_regions(jhu)))
})

context("test-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(jhu))

})

context("test-ggseg")
test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = jhu),c("gg","ggplot"))

  expect_is(ggseg(atlas = jhu, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = jhu, mapping = aes(fill = region)) +
              scale_fill_brain("jhu", package = "ggsegJHU"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = jhu, mapping = aes(fill = region)) +
              scale_fill_brain("jhu", package = "ggsegJHU"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = jhu, mapping=aes(fill=area), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=jhu_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(jhu_3d))

})
