test_that("stac_catalogs() returns a tibble", {
  result <- stac_catalogs()
  expect_s3_class(result, "tbl_df")
})

test_that("stac_catalogs() has expected columns", {
  result <- stac_catalogs()
  expect_named(result, c("name", "url", "provider"))
})

test_that("stac_catalogs() contains known catalogs", {
  result <- stac_catalogs()
  expect_true("Earth Search" %in% result$name)
  expect_true("Planetary Computer" %in% result$name)
  expect_true("USGS" %in% result$name)
})

test_that("stac_catalogs() has at least 3 rows", {
  result <- stac_catalogs()
  expect_gte(nrow(result), 3)
})

test_that("stac_catalogs() URLs start with https", {
  result <- stac_catalogs()
  expect_true(all(grepl("^https://", result$url)))
})
