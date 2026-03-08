test_that("stac_download() rejects non-doc_items input", {
  expect_error(stac_download(items = data.frame()), "doc_items")
})

test_that("stac_search_raw() returns doc_items", {
  skip_on_cran()
  skip_if_not(has_internet())

  raw <- stac_search_raw(
    url = "https://earth-search.aws.element84.com/v1",
    collections = "sentinel-2-l2a",
    bbox = c(-84.5, 38.0, -84.3, 38.2),
    limit = 1
  )

  expect_s3_class(raw, "doc_items")
})
