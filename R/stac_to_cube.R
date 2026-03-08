# stac_to_cube — stacr

#' Convert STAC Items to a gdalcubes Image Collection
#'
#' Bridges STAC search results to 'gdalcubes' for raster data cube analysis.
#' Requires the 'gdalcubes' package to be installed.
#'
#' @param items An rstac `doc_items` object as returned by [stac_search_raw()]
#'   or [rstac::post_request()].
#' @param asset_names Character vector. Asset names to include in the
#'   image collection (e.g., `c("red", "green", "blue")`).
#' @param ... Additional arguments passed to
#'   `gdalcubes::stac_image_collection()`.
#'
#' @returns A `gdalcubes` image collection object.
#'
#' @export
#'
#' @examplesIf has_internet() && requireNamespace("gdalcubes", quietly = TRUE)
#' \donttest{
#' raw <- stac_search_raw(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collections = "sentinel-2-l2a",
#'   bbox = c(-84.5, 38.0, -84.3, 38.2),
#'   limit = 5
#' )
#' cube <- stac_to_cube(raw, asset_names = c("red", "green", "blue"))
#' }
stac_to_cube <- function(items, asset_names = NULL, ...) {
  if (!inherits(items, "doc_items")) {
    cli::cli_abort(
      "{.arg items} must be an rstac {.cls doc_items} object from {.fn stac_search_raw} or {.fn rstac::post_request}."
    )
  }

  check_suggested_pkg("gdalcubes")

  gdalcubes::stac_image_collection(
    s = items$features,
    asset_names = asset_names,
    ...
  )
}
