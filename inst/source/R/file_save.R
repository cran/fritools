#' Create a Copy of a File
#'
#' I often want a timestamped copy as backup of a file or directory.
#' @param x A path to a file.
#' @param file_extension_pattern A Pattern to mark a file extension. If matched,
#' the time stamp will get inserted before that pattern.
#' @param force Force even if \code{file_extension_pattern} is not matched. Set
#' to \code{\link{FALSE}} to skip stamping such files.
#' @param recursive Passed to \code{\link{file.copy}}.
#' @template stop_on_error
#' @template return_boolean
#' @family operating system functions
#' @family file utilities
#' @export
#' @examples
#' f <- tempfile()
#' try(file_save(f))
#' touch(f)
#' file_save(f, recursive = FALSE)
#' f <- paste0(file.path(tempfile()), ".txt")
#' touch(f)
#' file_save(f) # file.copy gives a warning
#' dir(tempdir())
file_save <- function(x, file_extension_pattern = "\\.[A-z]{1,5}$",
                       force = TRUE, recursive = dir.exists(x),
                       stop_on_error = TRUE) {
    res <- FALSE
    if (!file.exists(x)) {
        msg <- paste0("`", x, "` is not a path to a file.")
        if (isTRUE(stop_on_error)) {
            throw(msg)
        } else {
            warning(msg)
        }
    } else {
        if (grepl(file_extension_pattern, x)) {
            to <- sub(paste0("(", file_extension_pattern, ")"),
                      paste0(format(file.mtime(x), "_%Y_%m_%d_%H_%M_%S"),
                             "\\1"),
                      x)
            res <- file.copy(from = x, to = to, recursive = recursive)
        } else {
            if (isTRUE(force)) {
                to <-  paste0(x, format(file.mtime(x), "_%Y_%m_%d_%H_%M_%S"))
                res <- file.copy(from = x, to = to, recursive = recursive)
            } else {
                warning("Set `force` to `TRUE` to force.")
            }
        }
    }
    return(res)
}
