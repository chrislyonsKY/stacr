test_that("stac_map() requires leaflet and sf", {
  skip_if_not_installed("leaflet")
  skip_if_not_installed("sf")

  # Valid items tibble with geometry column
  items <- tibble::tibble(
    id = character(),
    collection = character(),
    datetime = character(),
    bbox = list(),
    geometry = list(),
    assets = list()
  )

  # Empty items should return a leaflet widget
  result <- stac_map(items)
  expect_s3_class(result, "leaflet")
})

test_that("stac_map() rejects input without geometry column", {
  skip_if_not_installed("leaflet")
  skip_if_not_installed("sf")

  expect_error(stac_map(data.frame(id = 1)), "geometry")
})
