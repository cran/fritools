#' Does the Return Value of a Command Signal Success?
#'
#' This is just a wrapper to ease the evaluation of retrun values from external
#' commands:
#' External commands return 0 on success, which is
#' \code{\link[base:FALSE]{FALSE}}, when converted to logical.
#'
#' @param x The external commands return value.
#' @template return_boolean
#' @export 
is_success <- function(x) return(!as.logical(x))
