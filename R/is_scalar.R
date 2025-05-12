#' Check Whether an R Object is Scalar
#'
#' \R is vector based. But I often come across vectors of length 1 or arrays and
#' matrices with a single element.
#' @param x An \R object.
#' @return A boolean.
#' @family logical helpers
#' @export
#' @examples
#' x <- "C"
#' is_scalar(x)
#' x <- LETTERS[1:24]
#' !is_scalar(x)
#' is_scalar(x[3])
#' dim(x) <- c(6, 4)
#' !is_scalar(x)
#' is_scalar(x[1, 2])
#' dim(x) <- c(2, 3, 4)
#' !is_scalar(x)
#' is_scalar(x[1, 2, 3])
#' is_scalar(list(1))
is_scalar <- function(x) {
    res <- is.null(dim(x)) && identical(length(x), 1L) ||
        !is.null(dim(x)) && all(dim(x) == 1L)
    return(res)
}

