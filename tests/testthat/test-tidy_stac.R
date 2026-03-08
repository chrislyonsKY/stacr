test_that("tidy_items() returns expected columns for empty result", {
  mock_items <- structure(
    list(
      type = "FeatureCollection",
      features = list()
    ),
    class = c("doc_items", "rstac_doc", "list")
  )
  # Simulate items_length returning 0
  result <- tidy_items(mock_items)
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "collection", "datetime", "bbox", "geometry", "assets"))
  expect_equal(nrow(result), 0)
})

test_that("tidy_collections() returns expected columns for empty result", {
  mock_collections <- structure(
    list(collections = list()),
    class = c("doc_collections", "rstac_doc", "list")
  )
  result <- tidy_collections(mock_collections)
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "title", "description"))
  expect_equal(nrow(result), 0)
})
