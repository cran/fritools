#' Remove All Objects From an Environment
#'
#' @param environment The environment that should be wiped clean.
#' @return A character vector containing the names of objects removed, but
#' called for its side effect of removing all objects from the environment.
#' @export
#' @examples
#' e <- new.env()
#' assign("a", 1, envir = e)
#' assign("b", 1, envir = e)
#' ls(envir = e)
#' wipe_clean(envir = e)
#' ls(envir = e)
#' RUnit::checkIdentical(length(ls(envir = e)), 0L)
wipe_clean <- function(environment) {
    objects <- ls(name = environment, all.names = TRUE)
    rm(list = objects, envir = environment)
    return(invisible(objects))
}
