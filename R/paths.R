#' Set or Get the \code{path} Attribute to or from an Object
#'
#' We set paths on some objects, these are convenience wrappers to
#' \code{\link{attr}}.
#' @name paths
#' @param x An object.
#' @family file utilities.
#' @examples
#' x <- 2
#' path <- tempfile()
#' touch(path)
#' x <- set_path(x, path)
#' get_path(x)
NULL


#' @export
#' @rdname paths
#' @aliases get_path
#' @return For \code{get_path} the value of \code{attr(x, "path")}.
get_path <- function(x) {
    path <- attr(x, "path")
    if (is.null(path)) {
        throw(paste0("No `path` attribute set on ",
                     deparse(substitute(x)), "."))
    } else {
        if (!file.exists(path))
            throw("`path` does not exists.")
        if (!utils::file_test(op = "-f", path))
            throw("`path` is a directory, not a file.")
    }
    return(path)
}

#' @export
#' @param path The path to be set.
#' @param overwrite Overwrite an existing \emph{path} attribute instead of
#' throwing an error?
#' @rdname paths
#' @aliases set_path
#' @return For \code{set_path} the modified object.
set_path <- function(x, path, overwrite = FALSE) {
    if (!is.null(attr(x, "path")) && ! isTRUE(overwrite)) {
        throw("Attribute `path` already set, skipping!")
    }
    if (!file.exists(path)) {
        warning("Use\n `attr(x, \"path\") <- path`\ninstead.")
        throw("`path` does not exists.")
    }
    attr(x, "path") <- path
    if (!utils::file_test(op = "-f", path))
        throw("`path` is a directory, not a file.")
    return(x)
}
