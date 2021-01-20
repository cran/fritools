#' Search Files for a Pattern
#'
#' This is an approximation of unix find and grep.
#' @param what A regex pattern for which to search.
#' @param verbose Be verbose?
#' @param exclude A regular expression for excluding files.
#' @param ... Arguments passed to \code{\link{list.files}}.
#' @export
#' @return \link[base:invisible]{Invisibly} a vector of names of files
#' containing the pattern given by \bold{what}.
#' @family file searching functions
#' @examples
#' write.csv(mtcars, file.path(tempdir(), "mtcars.csv"))
#'  for (i in 0:9) {
#'      write.csv(iris, file.path(tempdir(), paste0("iris", i, ".csv")))
#'  }
#' search_files(what = "Mazda", path = tempdir(), pattern = "^.*\\.csv$")
#' search_files(what = "[Ss]etosa", path = tempdir(), pattern = "^.*\\.csv$")
#' x <- search_files(path = tempdir(),
#'                   pattern = "^.*\\.csv$",
#'                   exclude = "[2-9]\\.csv$",
#'                   what = "[Ss]etosa")
#' summary(x)
#' summary(x, type = "what")
#' summary(x, type = "matches")
search_files <- function(what, verbose = TRUE, exclude = NULL, ...) {
    files <- list.files(..., full.names = TRUE)
    if (! is.null(exclude))
        files <- grep(pattern = exclude, x = files, value = TRUE, invert = TRUE)
    res <- NULL
    for (file in files) {
        lines <- suppressWarnings(readLines(file))
        hits <- suppressWarnings(grepl(lines, pattern = what))
        matches <- suppressWarnings(grep(lines, pattern = what, value = TRUE))
        if (any(hits)) {
            if (isTRUE(verbose)) message("Found `", what, "` in file ", file)
            tmp <- cbind(file, what, matches)
            res <- rbind(res, tmp)
        }
    }
    res <- as.data.frame(res)
    class(res) <- c("filesearch", class(res))
    return(invisible(res))
}

#' Summarize File Searches
#'
#' @param object A object returned by \code{\link{search_files}}.
#' @param type Type of summary.
#' @param ... Needed for compatibility.
#' @export
#' @return A summarized object.
#' @family file searching functions
summary.filesearch <- function(object, ...,
                               type = c("file", "what", "matches")) {
    type <- match.arg(type)
    r <- switch(type,
           "file" = {
               unique(object[type])
           },
           "what" = {
               unique(object[TRUE, c("file", "what")])
           },
           "matches" = {
               object[TRUE, c("file", "matches")]
           })
    return(r)
}
