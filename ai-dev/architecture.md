# Architecture — stacr

        ## Exported Functions

        `stac_search()`, `stac_collections()`, `stac_items()`, `stac_download()`, `stac_to_cube()`, `stac_map()`, `stac_catalogs()`

        ## Module Files

        - `R/stac_search.R`
- `R/stac_collections.R`
- `R/stac_items.R`
- `R/stac_download.R`
- `R/stac_to_cube.R`
- `R/stac_map.R`
- `R/stac_catalogs.R`
- `R/registry.R`
- `R/tidy_stac.R`
- `R/utils.R`

        ## Dependency Strategy

        - **Imports (always available):** rstac, tibble, cli
        - **Suggests (checked at runtime):** gdalcubes, leaflet, sf, testthat, knitr, rmarkdown
