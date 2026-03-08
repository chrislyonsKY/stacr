# stac_download — stacr

#' Download STAC Assets
#'
#' Downloads assets from STAC items returned by [stac_search()] or
#' [stac_items()]. Wraps [rstac::assets_download()] with tidy output.
#'
#' @param items An rstac `doc_items` object as returned by [stac_search()] or
#'   [stac_items()] with the `raw` attribute, or the raw rstac result directly.
#' @param assets Character vector. Asset names to download (e.g.,
#'   `c("red", "green", "blue")`). If `NULL`, downloads all assets.
#' @param output_dir Character. Directory where files are saved.
#'   Defaults to [tempdir()].
#' @param overwrite Logical. Overwrite existing files? Defaults to `FALSE`.
#'
#' @returns The rstac items object (invisibly) with assets downloaded to
#'   `output_dir`. Downloaded file paths can be retrieved with
#'   [rstac::assets_url()].
#'
#' @export
#'
#' @examplesIf has_internet()
#' \donttest{
#' # Search for items first
#' items <- stac_search(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collections = "sentinel-2-l2a",
#'   bbox = c(-84.5, 38.0, -84.3, 38.2),
#'   limit = 1
#' )
#' }
stac_download <- function(items,
                          assets = NULL,
                          output_dir = tempdir(),
                          overwrite = FALSE) {
  if (!inherits(items, "doc_items")) {
    cli::cli_abort(
      "{.arg items} must be an rstac {.cls doc_items} object from {.fn stac_search_raw} or {.fn rstac::post_request}."
    )
  }

  res <- rstac::assets_download(
    items = items,
    asset_names = assets,
    output_dir = output_dir,
    overwrite = overwrite
  )

  invisible(res)
}

#' Search STAC and Return Raw rstac Result
#'
#' Like [stac_search()] but returns the raw rstac `doc_items` object
#' instead of a tibble. Useful as input for [stac_download()] and
#' [stac_to_cube()].
#'
#' @inheritParams stac_search
#'
#' @returns An rstac `doc_items` object.
#'
#' @export
#'
#' @examplesIf has_internet()
#' \donttest{
#' raw <- stac_search_raw(
#'   url = "https://earth-search.aws.element84.com/v1",
#'   collections = "sentinel-2-l2a",
#'   bbox = c(-84.5, 38.0, -84.3, 38.2),
#'   limit = 1
#' )
#' }
stac_search_raw <- function(url,
                            collections = NULL,
                            bbox = NULL,
                            datetime = NULL,
                            limit = 100L) {
  validate_url(url)
  if (!is.null(bbox)) validate_bbox(bbox)

  q <- rstac::stac(url)
  q |>
    rstac::stac_search(
      collections = collections,
      bbox = bbox,
      datetime = datetime,
      limit = as.integer(limit)
    ) |>
    rstac::post_request()
}
