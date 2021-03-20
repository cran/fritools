#' Apply a Function Over a Ragged Array
#'
#' This is a modified version of \code{\link[base:tapply]{base::tapply}} to
#' allow for \code{\link{data.frame}}s to be passed as \code{X}.
#' @param X See \code{\link[base:tapply]{base::tapply}}.
#' @param INDEX See \code{\link[base:tapply]{base::tapply}}.
#' @param FUN See \code{\link[base:tapply]{base::tapply}}.
#' @param ... See \code{\link[base:tapply]{base::tapply}}.
#' @param default See \code{\link[base:tapply]{base::tapply}}.
#' @param simplify See \code{\link[base:tapply]{base::tapply}}.
#' @return See \code{\link[base:tapply]{base::tapply}}.
#' @export
#' @examples
#' result <- fritools::tapply(warpbreaks[["breaks"]], warpbreaks[, -1], sum)
#' expectation <- base::tapply(warpbreaks[["breaks"]], warpbreaks[, -1], sum)
#' RUnit::checkIdentical(result, expectation)
#' data("mtcars")
#' s <- stats::aggregate(x = mtcars[["mpg"]],
#'                       by = list(mtcars[["cyl"]], mtcars[["vs"]]),
#'                       FUN = mean)
#' t <- base::tapply(X = mtcars[["mpg"]],
#'                   INDEX = list(mtcars[["cyl"]], mtcars[["vs"]]),
#'                   FUN = mean)
#' if (require("reshape", quietly = TRUE)) {
#'     suppressWarnings(tm <- na.omit(reshape::melt(t)))
#'     if (RUnit::checkEquals(s, tm, check.attributes = FALSE))
#'         message("Works!")
#' }
#' message("If you don't pass weigths, this is equal to:")
#' w <- base::tapply(X = mtcars[["mpg"]], INDEX = list(mtcars[["cyl"]],
#'                                                     mtcars[["vs"]]),
#'                   FUN = stats::weighted.mean)
#' all.equal(w, t, check.attributes = FALSE)
#' message("But how do you pass those weights?")
#' # we define a wrapper to pass the column names for a data.frame:
#' weighted_mean <- function(df, x, w) {
#'     weighted.mean(df[[x]], df[[w]])
#' }
#' if (RUnit::checkIdentical(weighted.mean(mtcars[["mpg"]], mtcars[["wt"]]),
#'                           weighted_mean(mtcars, "mpg", "wt")))
#'     message("Works!")
#' message("base::tapply can't deal with data.frames:")
#' try(base::tapply(X = mtcars, INDEX = list(mtcars[["cyl"]], mtcars[["vs"]]),
#'                  FUN = weighted_mean, x = "mpg", w = "wt"))
#' wm <- fritools::tapply(X = mtcars, INDEX = list(mtcars[["cyl"]],
#'                                                 mtcars[["vs"]]),
#'                        FUN = weighted_mean, x = "mpg", w = "wt")
#' subset <- mtcars[mtcars[["cyl"]] == 6 & mtcars[["vs"]] == 0, c("mpg", "wt")]
#' stats::weighted.mean(subset[["mpg"]], subset[["wt"]]) == wm
tapply <- function(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE) {
    FUN <- if (!is.null(FUN))
        match.fun(FUN)
    if (!is.list(INDEX))
        INDEX <- list(INDEX)
    INDEX <- lapply(INDEX, as.factor)
    nI <- length(INDEX)
    if (!nI)
        stop("'INDEX' is of length zero")
    if (is.data.frame(X)) {
        if (!all(lengths(INDEX) == nrow(X)))
            stop("arguments must have same length")
    } else {
        if (!all(lengths(INDEX) == length(X)))
            stop("arguments must have same length")
    }
    namelist <- lapply(INDEX, levels)
    extent <- lengths(namelist, use.names = FALSE)
    cumextent <- cumprod(extent)
    if (cumextent[nI] > .Machine[["integer.max"]])
        stop("total number of levels >= 2^31")
    storage.mode(cumextent) <- "integer"
    ngroup <- cumextent[nI]
    group <- as.integer(INDEX[[1L]])
    if (nI > 1L)
        for (i in 2L:nI) group <- group + cumextent[i - 1L] *
            (as.integer(INDEX[[i]]) - 1L)
    if (is.null(FUN))
        return(group)
    levels(group) <- as.character(seq_len(ngroup))
    class(group) <- "factor"
    ans <- split(X, group)
    names(ans) <- NULL
    INDEX <- as.logical(lengths(ans))
    ans <- lapply(X = ans[INDEX], FUN = FUN, ...)
    ansmat <- array(if (simplify && all(lengths(ans) == 1L)) {
        ans <- unlist(ans, recursive = FALSE, use.names = FALSE)
        if (!is.null(ans) && is.na(default) && is.atomic(ans))
            vector(typeof(ans))
        else default
    }
    else vector("list", prod(extent)), dim = extent, dimnames = namelist)
    if (length(ans)) {
        ansmat[INDEX] <- ans
    }
    ansmat
}
