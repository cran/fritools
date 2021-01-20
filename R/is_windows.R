#' Is the System Running a Windows Machine?
#'
#' @return \code{\link{TRUE}} if so, \code{\link{FALSE}} otherwise.
#' @export
is_windows <- function() return(.Platform[["OS.type"]] == "windows")
