test_that("stac_to_cube() requires gdalcubes", {
  skip_if(requireNamespace("gdalcubes", quietly = TRUE))

  mock_items <- structure(list(), class = c("doc_items", "rstac_doc", "list"))
  expect_error(stac_to_cube(mock_items), "gdalcubes")
})

test_that("stac_to_cube() rejects non-doc_items input", {
  expect_error(stac_to_cube(data.frame()), "doc_items")
})
