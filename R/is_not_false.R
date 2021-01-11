#' Test if an Object is Not False
#'
#' Sometimes you need to know whether or not an object exists and is not set to
#' FALSE (and possibly not NULL).
#'
#' @param object The object to be tested.
#' @param null_is_false Should NULL be treated as FALSE?
#' @param ... Parameters passed to \code{\link{exists}}. See Examples.
#' @return TRUE if the object is set to something different than FALSE, FALSE
#' otherwise.
#' @keywords internal
#' @export
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
is_not_false <- function(object, null_is_false = TRUE, ...) {
    if (requireNamespace("checkmate", quietly = TRUE))
        checkmate::qassert(null_is_false, "B1")
    condition <- exists(deparse(substitute(object)), ...)
    if (isTRUE(null_is_false)) {
        condition <- condition && ! is.null(object) && object != FALSE
    } else {
        condition <- condition && (is.null(object) || object != FALSE)
    }
    if (condition)
        result <- TRUE
    else
        result <- FALSE
    return(result)
}
