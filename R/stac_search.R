# stac_search — stacr

#' Search a STAC API
#'
#' Searches a STAC API endpoint for items matching the given filters and
#' returns results as a tidy tibble. Wraps [rstac::stac_search()] with
#' tidy output.
#'
#' @param url Character. Root URL of a STAC API endpoint
#'   (e.g., `"https://earth-search.aws.element84.com/v1"`).
#' @param collections Character vector. Collection IDs to search within.
#' @param bbox Numeric vector of length 4: `c(xmin, ymin, xmax, ymax)`.
#'   Only items intersecting this bounding box are returned.
#' @param datetime Character. Date/time filter as a single datetime or
#'   range (e.g., `"2024-01-01/2024-12-31"`). Follows RFC 3339.
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
#' stac_search(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collections = "sentinel-2-l2a",
#'   bbox = c(-84.5, 38.0, -84.3, 38.2),
#'   limit = 5
#' )
#' }
stac_search <- function(url,
                        collections = NULL,
                        bbox = NULL,
                        datetime = NULL,
                        limit = 100L) {
  validate_url(url)
  if (!is.null(bbox)) validate_bbox(bbox)

  q <- rstac::stac(url)
  res <- q |>
    rstac::stac_search(
      collections = collections,
      bbox = bbox,
      datetime = datetime,
      limit = as.integer(limit)
    ) |>
    rstac::post_request()

  tidy_items(res)
}
