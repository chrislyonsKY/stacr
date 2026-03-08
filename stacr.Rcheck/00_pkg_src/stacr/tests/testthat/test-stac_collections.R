test_that("stac_collections() returns a tibble with expected columns", {
  skip_on_cran()
  skip_if_not(has_internet())

  result <- stac_collections("https://earth-search.aws.element84.com/v1")

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "title", "description"))
  expect_gt(nrow(result), 0)
})

test_that("stac_collections() validates url", {
  expect_error(stac_collections(""), "non-empty")
  expect_error(stac_collections("ftp://bad"), "http://")
})
