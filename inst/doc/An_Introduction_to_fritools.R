## -----------------------------------------------------------------------------
path <- system.file(package = "fritools")
m <- packager::build_manual(path = path,
                            output_directory = tempdir(),
                            roxygenise = FALSE, verbose = FALSE)
path <- strsplit(grep("--output", m[["command"]], value = TRUE),
                 split = "=")[[1]][[2]]
fritools::view(path, program = "evince")


## -----------------------------------------------------------------------------
path <- system.file(package = "fritools")
if (file.exists(file.path(path, "source")))
    path <- file.path(path, "source")
missing <- suppressWarnings(fritools::find_missing_see_also(path = path))
if (length(missing) > 1) {
    print(missing)
    stop("Functions without context.")
} else {
    message("All functions with context.")
}

