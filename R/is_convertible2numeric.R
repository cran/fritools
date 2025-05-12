#' Check Whether a Scalar is Convertible to Numeric
#'
#' @param x A Scalar.
#' @return A boolean.
#' @export
#' @family logical helpers
#' @examples
#' x <- "3"
#' tinytest::expect_true(is_scalar_convertible2numeric(as.vector(x)))
#' tinytest::expect_true(is_scalar_convertible2numeric(as.list(x)))
#' tinytest::expect_true(is_scalar_convertible2numeric(as.array(x)))
#' tinytest::expect_true(is_scalar_convertible2numeric(as.matrix(x)))
#' x <- as.character(1:24)
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_true(is_scalar_convertible2numeric(x[3]))
#' dim(x) <- c(6, 4)
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_true(is_scalar_convertible2numeric(x[1, 2]))
#' dim(x) <- c(2, 3, 4)
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_true(is_scalar_convertible2numeric(x[1, 2, 3]))
#' 
#' x <- LETTERS[1:24]
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_false(is_scalar_convertible2numeric(x[3]))
#' dim(x) <- c(6, 4)
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_false(is_scalar_convertible2numeric(x[1, 2]))
#' dim(x) <- c(2, 3, 4)
#' tinytest::expect_error(is_scalar_convertible2numeric(x))
#' tinytest::expect_false(is_scalar_convertible2numeric(x[1, 2, 3]))
is_scalar_convertible2numeric <- function(x) {
    stopifnot(is_scalar(x))
    res <- tryCatch(as.numeric(x), 
                  warning = function(w) return(x))
    res <- is.numeric(res)
    return(res)
}
