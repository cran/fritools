#' Compare Two Vectors
#'
#' Side-by-side comparison of two vectors.
#' @param x,y Two vectors of the same mode.
#' @export
#' @return A matrix containing the side-by-side comparison.
#' @examples
#' data(mtcars)
#' cars <- rownames(mtcars)
#' carz <- cars[-grep("Merc", cars)]
#' cars <- cars[nchar(cars) < 15]
#' compare_vectors(cars, carz)
compare_vectors <- function(x, y) {
    names <- c(deparse(substitute(x)), deparse(substitute(y)))
    u <-  sort(union(x, y))
    x_only <- setdiff(u, x)
    y_only <- setdiff(u, y)
    ix <- match(x_only, u)
    iy <- match(y_only, u)
    m <- cbind(x = u, y = u)
    m[iy, "y"] <- NA
    m[ix, "x"] <- NA
    dimnames(m)[[2]] <- names
    dimnames(m)[[1]] <- u
    return(m)
}
