test_that("stac_search() exists", {
  expect_true(is.function(stac_search))
})

test_that("stac_collections() exists", {
  expect_true(is.function(stac_collections))
})

test_that("stac_items() exists", {
  expect_true(is.function(stac_items))
})

test_that("stac_download() exists", {
  expect_true(is.function(stac_download))
})

test_that("stac_to_cube() exists", {
  expect_true(is.function(stac_to_cube))
})

test_that("stac_map() exists", {
  expect_true(is.function(stac_map))
})

test_that("stac_catalogs() exists", {
  expect_true(is.function(stac_catalogs))
})

test_that("stac_search_raw() exists", {
  expect_true(is.function(stac_search_raw))
})

test_that("has_internet() exists", {
  expect_true(is.function(has_internet))
})
