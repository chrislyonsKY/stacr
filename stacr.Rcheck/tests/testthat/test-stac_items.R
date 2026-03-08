test_that("stac_items() returns a tibble with expected columns", {
  skip_on_cran()
  skip_if_not(has_internet())

  result <- stac_items(
    url = "https://earth-search.aws.element84.com/v1",
    collection = "sentinel-2-l2a",
    limit = 3
  )

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "collection", "datetime", "bbox", "geometry", "assets"))
  expect_equal(nrow(result), 3)
})

test_that("stac_items() validates url", {
  expect_error(stac_items(url = "", collection = "x"), "non-empty")
})

test_that("stac_items() validates collection", {
  expect_error(stac_items(url = "https://example.com", collection = ""), "non-empty")
  expect_error(stac_items(url = "https://example.com", collection = 123), "character")
})
