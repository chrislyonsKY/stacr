# stac_catalogs — stacr

#' List Known STAC Catalogs
#'
#' Returns a tibble of known STAC API endpoints bundled with the package.
#' Includes Planetary Computer, Earth Search, and USGS catalogs.
#'
#' @returns A [tibble::tibble] with columns:
#' \describe{
#'   \item{name}{Human-readable catalog name.}
#'   \item{url}{Root URL of the STAC API endpoint.}
#'   \item{provider}{Organization providing the catalog.}
#' }
#'
#' @export
#'
#' @examples
#' stac_catalogs()
stac_catalogs <- function() {
  stac_registry()
}
