test_that("validate_bbox rejects non-numeric input", {
  expect_error(validate_bbox("bad"), "numeric vector")
})

test_that("validate_bbox rejects wrong length", {

  expect_error(validate_bbox(c(1, 2)), "numeric vector of length 4")
})

test_that("validate_bbox rejects xmin >= xmax", {
  expect_error(validate_bbox(c(10, 0, 5, 5)), "xmin")
})

test_that("validate_bbox rejects ymin >= ymax", {
  expect_error(validate_bbox(c(0, 10, 5, 5)), "ymin")
})

test_that("validate_bbox accepts valid bbox", {
  expect_invisible(validate_bbox(c(-84.5, 38.0, -84.3, 38.2)))
})

test_that("validate_url rejects empty string", {
  expect_error(validate_url(""), "non-empty")
})

test_that("validate_url rejects non-http URL", {
  expect_error(validate_url("ftp://example.com"), "http://")
})

test_that("validate_url accepts valid URL", {
  expect_invisible(validate_url("https://example.com"))
})

test_that("has_internet returns logical", {
  result <- has_internet()
  expect_type(result, "logical")
  expect_length(result, 1)
})

test_that("check_suggested_pkg errors for missing package", {
  expect_error(check_suggested_pkg("notarealpackage123"), "required")
})

test_that("check_suggested_pkg passes for installed package", {
  expect_invisible(check_suggested_pkg("tibble"))
})
