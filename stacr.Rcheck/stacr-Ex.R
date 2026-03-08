pkgname <- "stacr"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "stacr-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('stacr')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("has_internet")
### * has_internet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: has_internet
### Title: Check internet connectivity
### Aliases: has_internet

### ** Examples

has_internet()



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("has_internet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_catalogs")
### * stac_catalogs

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_catalogs
### Title: List Known STAC Catalogs
### Aliases: stac_catalogs

### ** Examples

stac_catalogs()



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_catalogs", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_collections")
### * stac_collections

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_collections
### Title: List STAC Collections
### Aliases: stac_collections

### ** Examples

## Don't show: 
if (has_internet()) withAutoprint({ # examplesIf
## End(Don't show)
stac_collections("https://earth-search.aws.element84.com/v1")
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_collections", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_download")
### * stac_download

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_download
### Title: Download STAC Assets
### Aliases: stac_download

### ** Examples

## Don't show: 
if (has_internet()) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
# Search for items first
items <- stac_search(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  limit = 1
)
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_download", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_items")
### * stac_items

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_items
### Title: List Items in a STAC Collection
### Aliases: stac_items

### ** Examples

## Don't show: 
if (has_internet()) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
stac_items(
  url = "https://earth-search.aws.element84.com/v1",
  collection = "sentinel-2-l2a",
  limit = 5
)
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_items", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_map")
### * stac_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_map
### Title: Map STAC Item Footprints
### Aliases: stac_map

### ** Examples

## Don't show: 
if (has_internet() && requireNamespace("leaflet", quietly = TRUE) && requireNamespace("sf", quietly = TRUE)) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
items <- stac_search(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  limit = 5
)
stac_map(items)
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_search")
### * stac_search

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_search
### Title: Search a STAC API
### Aliases: stac_search

### ** Examples

## Don't show: 
if (has_internet()) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
stac_search(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  limit = 5
)
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_search", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_search_raw")
### * stac_search_raw

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_search_raw
### Title: Search STAC and Return Raw rstac Result
### Aliases: stac_search_raw

### ** Examples

## Don't show: 
if (has_internet()) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
raw <- stac_search_raw(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  limit = 1
)
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_search_raw", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("stac_to_cube")
### * stac_to_cube

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: stac_to_cube
### Title: Convert STAC Items to a gdalcubes Image Collection
### Aliases: stac_to_cube

### ** Examples

## Don't show: 
if (has_internet() && requireNamespace("gdalcubes", quietly = TRUE)) withAutoprint({ # examplesIf
## End(Don't show)
## No test: 
raw <- stac_search_raw(
  url = "https://earth-search.aws.element84.com/v1",
  collections = "sentinel-2-l2a",
  bbox = c(-84.5, 38.0, -84.3, 38.2),
  limit = 5
)
cube <- stac_to_cube(raw, asset_names = c("red", "green", "blue"))
## End(No test)
## Don't show: 
}) # examplesIf
## End(Don't show)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("stac_to_cube", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
