## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
has_net <- stacr::has_internet()

## ----setup--------------------------------------------------------------------
library(stacr)

## -----------------------------------------------------------------------------
stac_catalogs()

## ----eval = has_net-----------------------------------------------------------
stac_collections("https://earth-search.aws.element84.com/v1")

## ----eval = has_net-----------------------------------------------------------
items <- stac_search(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  datetime = "2024-06-01T00:00:00Z/2024-06-30T00:00:00Z",
  limit = 5
)
items

## ----eval = has_net-----------------------------------------------------------
stac_items(
  url = "https://earth-search.aws.element84.com/v1",
  collection = "sentinel-2-l2a",
  limit = 3
)

## ----eval = FALSE-------------------------------------------------------------
# raw <- stac_search_raw(
#   url = "https://earth-search.aws.element84.com/v1",
#   collections = "sentinel-2-l2a",
#   bbox = c(-84.5, 38.0, -84.3, 38.2),
#   limit = 10
# )
# cube <- stac_to_cube(raw, asset_names = c("red", "green", "blue"))

## ----eval = FALSE-------------------------------------------------------------
# items <- stac_search(
#   url = "https://earth-search.aws.element84.com/v1",
#   collections = "sentinel-2-l2a",
#   bbox = c(-84.5, 38.0, -84.3, 38.2),
#   limit = 5
# )
# stac_map(items)

