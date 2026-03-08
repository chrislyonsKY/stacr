# stac_map — stacr

#' Map STAC Item Footprints
#'
#' Creates an interactive 'leaflet' map showing the spatial footprints of
#' STAC items returned by [stac_search()] or [stac_items()]. Requires the
#' 'leaflet' and 'sf' packages to be installed.
#'
#' @param items A [tibble::tibble] of STAC items as returned by
#'   [stac_search()] or [stac_items()], with a `geometry` list column.
#'
#' @returns A `leaflet` htmlwidget object.
#'
#' @export
#'
#' @examplesIf has_internet() && requireNamespace("leaflet", quietly = TRUE) && requireNamespace("sf", quietly = TRUE)
#' \donttest{
#' items <- stac_search(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collections = "sentinel-2-l2a",
#'   bbox = c(-84.5, 38.0, -84.3, 38.2),
#'   limit = 5
#' )
#' stac_map(items)
#' }
stac_map <- function(items) {
  check_suggested_pkg("leaflet")
  check_suggested_pkg("sf")

  if (!inherits(items, "data.frame") || !"geometry" %in% names(items)) {
    cli::cli_abort(
      "{.arg items} must be a tibble with a {.field geometry} column, as returned by {.fn stac_search}."
    )
  }

  if (nrow(items) == 0L) {
    cli::cli_inform("No items to map.")
    return(leaflet::leaflet())
  }

  # Convert GeoJSON geometry list to sf
  geojson_list <- lapply(seq_len(nrow(items)), function(i) {
    g <- items[["geometry"]][[i]]
    g[["type"]] <- g[["type"]] %||% "Polygon"
    jsonlite_available <- requireNamespace("jsonlite", quietly = TRUE)
    if (jsonlite_available) {
      sf::st_read(
        jsonlite::toJSON(g, auto_unbox = TRUE),
        quiet = TRUE
      )
    } else {
      # Fallback: build from coordinates directly for Polygon type
      coords <- g[["coordinates"]]
      if (g[["type"]] == "Polygon") {
        sf::st_polygon(lapply(coords, function(ring) {
          do.call(rbind, lapply(ring, function(pt) c(pt[[1]], pt[[2]])))
        }))
      } else {
        NULL
      }
    }
  })

  # Build sf geometry column
  sfc <- sf::st_sfc(
    lapply(geojson_list, function(x) {
      if (inherits(x, "sf")) sf::st_geometry(x)[[1]] else x
    }),
    crs = 4326
  )
  sf_data <- sf::st_sf(
    id = items[["id"]],
    geometry = sfc
  )

  leaflet::leaflet(sf_data) |>
    leaflet::addTiles() |>
    leaflet::addPolygons(
      popup = ~id,
      weight = 2,
      opacity = 0.8,
      fillOpacity = 0.2
    )
}
