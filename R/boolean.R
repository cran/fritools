#' Provide \code{isFALSE} for R < 3.5.0
#'
#' I still use R 3.3.3 for testing, \code{isFALSE()} was introduced in R 3.5.0.
#'
#' @param x The object to be tested.
#' @return \code{\link[base:TRUE]{TRUE}} if the object is set to
#' \code{\link[base:FALSE]{FALSE}},
#' \code{\link[base:FALSE]{FALSE}}
#' otherwise.
#' @export
#' @family logical helpers.
#' @examples
#' is_false("not false")
#' is_false(FALSE)
is_false <- function(x) {
    if (exists("isFALSE", where = "package:base", mode = "function")) {
        res <- base::isFALSE(x)
    } else {
        res <- is.logical(x) && length(x) == 1L && !is.na(x) && !x
    }
    return(res)
}


#' Is an Object \code{\link[base:TRUE]{TRUE}} or \code{\link[base:NULL]{NULL}}?
#'
#' Is an object \code{\link[base:TRUE]{TRUE}} or \code{\link[base:NULL]{NULL}}?
#' @param x The object to be tested.
#' @return \code{\link[base:TRUE]{TRUE}} if the object is set to
#' \code{\link[base:TRUE]{TRUE}} or \code{\link[base:NULL]{NULL}},
#' \code{\link[base:FALSE]{FALSE}}
#' otherwise.
#' @export
#' @family logical helpers.
#' @examples
#' is_null_or_true("true") # FALSE
#' is_null_or_true(TRUE) # TRUE
#' is_null_or_true(NULL) # TRUE
#' suppressWarnings(rm("not_defined"))
#' try(is_null_or_true(not_defined)) # error
is_null_or_true <- function(x)
    return(isTRUE(x) || is.null(x))

#' Is an Object Set and not Set to \code{\link[base:FALSE]{FALSE}}?
#'
#' Sometimes you need to know whether or not an object exists and is not set to
#' \code{\link[base:FALSE]{FALSE}} (and possibly not
#' \code{\link[base:NULL]{NULL}}).
#'
#' @param x The object to be tested.
#' @param null_is_false Should \code{\link[base:NULL]{NULL}} be treated as
#' \code{\link[base:FALSE]{FALSE}}?
#' @param ... Parameters passed to \code{\link{exists}}. See Examples.
#' @return \code{\link[base:TRUE]{TRUE}} if the object is set to something
#' different than \code{\link[base:FALSE]{FALSE}},
#' \code{\link[base:FALSE]{FALSE}}
#' otherwise.
#' @export
#' @family logical helpers.
#' @examples
#' a  <- 1
#' is_not_false(a)
#' f <- function() {
#'     print(a)
#'     print(is_not_false(a))
#' }
#' f()
#'
#' f <- function() {
#'     a <- FALSE
#'     print(a)
#'     print(is_not_false(a))
#' }
#' f()
#'
#' f <- function() {
#'     print(a)
#'     print(is_not_false(a, null_is_false = TRUE,
#'                        inherits = FALSE))
#' }
#' f()
is_not_false <- function(x, null_is_false = TRUE, ...) {
    if (requireNamespace("checkmate", quietly = TRUE))
        checkmate::qassert(null_is_false, "B1")
    condition <- exists(deparse(substitute(x)), ...)
    if (isTRUE(null_is_false)) {
        condition <- condition && ! is.null(x) && x != FALSE
    } else {
        condition <- condition && (is.null(x) || x != FALSE)
    }
    if (condition)
        result <- TRUE
    else
        result <- FALSE
    return(result)
}
