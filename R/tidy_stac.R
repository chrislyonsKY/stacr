# tidy_stac — stacr
# Internal helpers to convert rstac responses to tibbles

#' Convert STAC items to a tidy tibble
#'
#' Extracts key fields from an rstac items response (`doc_items`) and returns
#' a flat tibble with one row per item.
#'
#' @param items An rstac `doc_items` object (result of [rstac::post_request()]
#'   or [rstac::get_request()] on a search or items endpoint).
#'
#' @returns A [tibble::tibble] with columns: `id`, `collection`, `datetime`,
#'   `bbox`, `geometry`, and `assets`. Additional property columns are included
#'   from `rstac::items_as_tibble()`.
#'
#' @keywords internal
tidy_items <- function(items) {
  n <- rstac::items_length(items)
  if (n == 0L) {
    return(tibble::tibble(
      id = character(),
      collection = character(),
      datetime = character(),
      bbox = list(),
      geometry = list(),
      assets = list()
    ))
  }

  features <- items[["features"]]

  # Core fields from top-level GeoJSON (not present in items_as_tibble)
  core <- tibble::tibble(
    id = vapply(features, function(f) f[["id"]] %||% NA_character_, character(1)),
    collection = vapply(features, function(f) f[["collection"]] %||% NA_character_, character(1)),
    datetime = vapply(features, function(f) {
      f[["properties"]][["datetime"]] %||% NA_character_
    }, character(1)),
    bbox = lapply(features, function(f) f[["bbox"]]),
    geometry = lapply(features, function(f) f[["geometry"]]),
    assets = lapply(features, function(f) names(f[["assets"]]))
  )
  core
}

#' Convert STAC collections to a tidy tibble
#'
#' @param collections An rstac `doc_collections` object.
#'
#' @returns A [tibble::tibble] with columns: `id`, `title`, `description`.
#'
#' @keywords internal
tidy_collections <- function(collections) {
  cols <- collections[["collections"]]
  if (is.null(cols) || length(cols) == 0L) {
    return(tibble::tibble(
      id = character(),
      title = character(),
      description = character()
    ))
  }

  tibble::tibble(
    id = vapply(cols, function(c) c[["id"]] %||% NA_character_, character(1)),
    title = vapply(cols, function(c) c[["title"]] %||% NA_character_, character(1)),
    description = vapply(cols, function(c) c[["description"]] %||% NA_character_, character(1))
  )
}
