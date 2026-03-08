# stac_items — stacr

#' List Items in a STAC Collection
#'
#' Retrieves items from a specific collection in a STAC API endpoint and
#' returns them as a tidy tibble. Wraps [rstac::items()] with tidy output.
#'
#' @param url Character. Root URL of a STAC API endpoint
#'   (e.g., `"https://earth-search.aws.element84.com/v1"`).
#' @param collection Character. The collection ID to list items from.
#' @param limit Integer. Maximum number of items to return. Defaults to 100.
#'
#' @returns A [tibble::tibble] with one row per item and columns:
#' \describe{
#'   \item{id}{Item identifier.}
#'   \item{collection}{Collection the item belongs to.}
#'   \item{datetime}{Acquisition datetime as a character string.}
#'   \item{bbox}{Bounding box as a numeric list column.}
#'   \item{geometry}{GeoJSON geometry as a list column.}
#'   \item{assets}{Character vector of available asset names.}
#' }
#'
#' @export
#'
#' @examplesIf has_internet()
#' \donttest{
#' stac_items(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collection = "sentinel-2-l2a",
#'   limit = 5
#' )
#' }
stac_items <- function(url, collection, limit = 100L) {
  validate_url(url)
  if (!is.character(collection) || length(collection) != 1 || nchar(collection) == 0) {
    cli::cli_abort("{.arg collection} must be a non-empty character string.")
  }

  q <- rstac::stac(url)
  res <- q |>
    rstac::collections(collection_id = collection) |>
    rstac::items(limit = as.integer(limit)) |>
    rstac::get_request()

  tidy_items(res)
}
