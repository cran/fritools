#' Is an R Package Installed
#'
#' @param x Name of the package as character string.
#' @param version Required minimum version of the package as character string.
#' @template return_boolean
#' @export
#' @examples
#' is_r_package_installed("base", "300.0.0")
#' is_r_package_installed("fritools", "1.0.0")
is_r_package_installed <- function(x, version = "0") {
    installed <- tryCatch(utils::packageVersion(x), error = function(e) NA)
    is_installed  <- !is.na(installed)
    is_sufficient <- is_version_sufficient(installed = as.character(installed),
                                           required = as.character(version))
    return(is_installed && is_sufficient)
}

#' Is an External Program Installed
#'
#' @param program Name of the program.
#' @template return_boolean
#' @export
#' @examples
#' is_installed("R")
#' is_installed("probably_not_installed")
is_installed <- function(program) {
    is_installed <- nchar(Sys.which(program)) > 0
    is_installed <- unname(is_installed)
    is_installed <- isTRUE(is_installed)
    return(is_installed)
}
