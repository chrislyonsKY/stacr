# utils — stacr
# Internal utility functions

#' Check internet connectivity
#'
#' Tests whether a network connection to a STAC endpoint is available.
#' Used in `@examplesIf` guards for network-dependent examples.
#'
#' @returns `TRUE` if an internet connection is available, `FALSE` otherwise.
#'
#' @export
#'
#' @examples
#' has_internet()
has_internet <- function() {
  tryCatch(
    {
      con <- url("https://earth-search.aws.element84.com/v1", open = "r")
      close(con)
      TRUE
    },
    error = function(e) FALSE
  )
}

#' Validate a bounding box
#'
#' Checks that `bbox` is a numeric vector of length 4 with valid coordinate
#' ordering: `c(xmin, ymin, xmax, ymax)`.
#'
#' @param bbox Numeric vector of length 4.
#'
#' @returns `bbox` invisibly if valid; throws an error otherwise.
#'
#' @keywords internal
validate_bbox <- function(bbox) {
  if (!is.numeric(bbox) || length(bbox) != 4) {
    cli::cli_abort(
      "{.arg bbox} must be a numeric vector of length 4: {.code c(xmin, ymin, xmax, ymax)}."
    )
  }
  if (bbox[[1]] >= bbox[[3]]) {
    cli::cli_abort(
      "{.arg bbox} xmin ({bbox[[1]]}) must be less than xmax ({bbox[[3]]})."
    )
  }
  if (bbox[[2]] >= bbox[[4]]) {
    cli::cli_abort(
      "{.arg bbox} ymin ({bbox[[2]]}) must be less than ymax ({bbox[[4]]})."
    )
  }
  invisible(bbox)
}

#' Validate a STAC endpoint URL
#'
#' @param url Character string.
#'
#' @returns `url` invisibly if valid; throws an error otherwise.
#'
#' @keywords internal
validate_url <- function(url) {
  if (!is.character(url) || length(url) != 1 || nchar(url) == 0) {
    cli::cli_abort("{.arg url} must be a non-empty character string.")
  }
  if (!grepl("^https?://", url)) {
    cli::cli_abort("{.arg url} must start with {.code http://} or {.code https://}.")
  }
  invisible(url)
}

#' Check that a suggested package is available
#'
#' @param pkg Package name as a string.
#'
#' @returns `TRUE` invisibly if available; throws an error otherwise.
#'
#' @keywords internal
check_suggested_pkg <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    cli::cli_abort(c(
      "Package {.pkg {pkg}} is required for this feature.",
      "i" = "Install it with: {.code install.packages(\"{pkg}\")}"
    ))
  }
  invisible(TRUE)
}
