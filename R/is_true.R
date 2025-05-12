#' Convert a \code{\link{logical}} Array to a Binary Boolean Array
#' 
#' I often use mathematical expressions to index data by its values. But when
#' the data contain missing values, the logical indices do not index the data,
#' so I need to convert them to boolean.
#' @param x An \code{\link{logical}} array, probably the result of some
#' kind of mathematical expression.
#' @return A binary boolean array indicating where the \code{\link{logical}}
#' array is \code{\link[base:isTRUE]{TRUE}}.
#' @export
#' @family logical helpers
#' @examples
#' x <- array(1:24, dim = c(2,3,4))
#' x[2,2,3] <- NA
#' print(x)
#' x < 20 # An array containing NA
#' is_true(x < 20) # An array boolean only, NA converted to FALSE
#' print(x <- x[2, TRUE, TRUE])
#' is_true(x < 20) # A matrix
#' x <- x[2, TRUE]
#' is_true(x < 20) # A vector
#' x <- x[3]
#' is_true(x < 20) # A scalar
is_true <- function(x) {
    stopifnot(is.logical(x))
    if (is.vector(x)) {
        res <- vapply(x, isTRUE, logical(1))
    } else {
        res <- apply(x, seq_len(length(dim(x))), isTRUE)
    }
    return(res)
}
