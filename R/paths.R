#' Set or Get the \code{path} Attribute to or from an Object
#'
#' We set paths on some objects, these are convenience wrappers to
#' \code{\link{attr}}.
#' @name paths
#' @param x An object.
#' @examples
#' x <- 2
#' path <- tempfile()
#' touch(path)
#' x <- set_path(x, path)
#' get_path(x)


#' @export
#' @rdname paths
#' @aliases get_path
#' @return For \code{get_path} the value of \code{attr(x, "path")}.
get_path <- function(x) {
    return(attr(x, "path"))
}

#' @export
#' @param path The path to be set.
#' @param must_work See \code{\link{normalizePath}}'s argument \code{mustWork}.
#' @rdname paths
#' @aliases set_path
#' @return For \code{set_path} the modified object.
set_path <- function(x, path, must_work = TRUE) {
    attr(x, "path") <- normalizePath(path, mustWork = must_work)
    return(x)
}
