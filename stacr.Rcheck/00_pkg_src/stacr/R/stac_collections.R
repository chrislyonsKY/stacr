# stac_collections — stacr

#' List STAC Collections
#'
#' Queries a STAC API endpoint and returns available collections as a tidy
#' tibble. Wraps [rstac::collections()] with tidy output.
#'
#' @param url Character. Root URL of a STAC API endpoint
#'   (e.g., `"https://earth-search.aws.element84.com/v1"`).
#'
#' @returns A [tibble::tibble] with one row per collection and columns:
#' \describe{
#'   \item{id}{Collection identifier.}
#'   \item{title}{Human-readable title.}
#'   \item{description}{Collection description.}
#' }
#'
#' @export
#'
#' @examplesIf has_internet()
#' stac_collections("https://earth-search.aws.element84.com/v1")
stac_collections <- function(url) {
  validate_url(url)

  q <- rstac::stac(url)
  res <- q |>
    rstac::collections() |>
    rstac::get_request()

  tidy_collections(res)
}
