# registry — stacr
# Internal catalog registry of known STAC endpoints

#' Built-in catalog registry
#'
#' Returns a tibble of known STAC API endpoints bundled with the package.
#'
#' @returns A [tibble::tibble] with columns: `name`, `url`, `provider`.
#'
#' @keywords internal
stac_registry <- function() {
  tibble::tibble(
    name = c(
      "Earth Search",
      "Planetary Computer",
      "USGS"
    ),
    url = c(
      "https://earth-search.aws.element84.com/v1",
      "https://planetarycomputer.microsoft.com/api/stac/v1",
      "https://landsatlook.usgs.gov/stac-server"
    ),
    provider = c(
      "Element 84",
      "Microsoft",
      "USGS"
    )
  )
}
