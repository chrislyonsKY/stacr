test_that("stac_search() returns a tibble with expected columns", {
  skip_on_cran()
  skip_if_not(has_internet())

  result <- stac_search(
    url = "https://earth-search.aws.element84.com/v1",
    collections = "sentinel-2-l2a",
    bbox = c(-84.5, 38.0, -84.3, 38.2),
    limit = 3
  )

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "collection", "datetime", "bbox", "geometry", "assets"))
  expect_equal(nrow(result), 3)
})

test_that("stac_search() validates url", {
  expect_error(stac_search(url = ""), "non-empty")
  expect_error(stac_search(url = "ftp://bad"), "http://")
})

test_that("stac_search() validates bbox", {
  expect_error(
    stac_search(url = "https://example.com", bbox = c(1, 2)),
    "numeric vector"
  )
})

test_that("stac_search() returns empty tibble for no results", {
  skip_on_cran()
  skip_if_not(has_internet())

  # Tiny bbox in the middle of the ocean, unlikely to have results
  result <- stac_search(
    url = "https://earth-search.aws.element84.com/v1",
    collections = "sentinel-2-l2a",
    bbox = c(0.001, 0.001, 0.002, 0.002),
    datetime = "1990-01-01T00:00:00Z/1990-01-02T00:00:00Z",
    limit = 1
  )

  expect_s3_class(result, "tbl_df")
})
