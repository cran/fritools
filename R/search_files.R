#' Search Files for a Pattern
#'
#' This is an approximation of unix find and grep.
#' @param what A regex pattern for which to search.
#' @param verbose Be verbose?
#' @param ... Arguments passed to \code{\link{list.files}}.
#' @export
#' @return \link[base:invisible]{Invisibly} a vector of names of files
#' containing the pattern given by \bold{what}.
#' @examples
#' write.csv(mtcars, file.path(tempdir(), "mtcars.csv"))
#' write.csv(iris, file.path(tempdir(), "iris.csv"))
#' search_files(what = "Mazda", path = tempdir(), pattern = "^.*\\.csv$")
#' search_files(what = "[Ss]etosa", path = tempdir(), pattern = "^.*\\.csv$")
search_files <- function(what, verbose = TRUE, ...) {
    files <- list.files(..., full.names = TRUE)
    res <- NULL
    for (f in files) {
        lines <- suppressWarnings(readLines(f))
        match <- suppressWarnings(grepl(lines, pattern = what))
        if (any(match)) {
            if (isTRUE(verbose)) message("Found `", what, "` in file ", f)
            res <- c(res, f)
        }
    }
    return(invisible(sort(res)))
}
