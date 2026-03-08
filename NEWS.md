# stacr 0.1.0

* Initial CRAN submission.
* Core functions: `stac_search()`, `stac_collections()`, `stac_items()`,
  `stac_download()`, `stac_catalogs()`.
* All results returned as tibbles (never nested lists).
* Catalog registry with Planetary Computer, Earth Search, and USGS endpoints.
* `stac_to_cube()` bridge to 'gdalcubes' for raster data cube analysis.
* `stac_map()` interactive leaflet mapping of item footprints.
* `stac_search_raw()` for raw rstac results (input to `stac_download()` and
  `stac_to_cube()`).
