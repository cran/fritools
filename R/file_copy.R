#' Force Copying a File While backing it up
#'
#' \code{\link{file.copy}} has an argument \code{overwrite} that allows for
#' overwriting existing files. But I often want to overwrite an existing file
#' while creating a backup copy of that file.
#' @param from See \code{\link{file.copy}}.
#' @param to See \code{\link{file.copy}}.
#' @template stop_on_error
#' @param ... Arguments passed to \code{\link{file.copy}}.
#' @template return_boolean
#' @family file utilities
#' @family operating system functions
#' @export
#' @examples
#' touch(f1 <- file.path(tempdir(), "first.R"))
#' touch(f2 <- file.path(tempdir(), "second.R"))
#' file_copy(f2, f1)
#' list.files(tempdir(), pattern = "first.*\\.R")
#' dir <- file.path(tempdir(), "subdir")
#' dir.create(dir)
#' file_copy(f1, dir)
#' touch(f1)
#' file_copy(f1, dir)
#' list.files(dir, pattern = "first.*\\.R")
file_copy <- function(from, to, stop_on_error = FALSE, ...) {
    if (dir.exists(to)) {
        target <- file.path(to, basename(from))
    } else {
        target <- to
    }
    if (!file.exists(target) || file.mtime(from) >= file.mtime(target)) {
        if (file.exists(target)) {
                file_save(target)
        }
        res <- file.copy(from = from, to = target, ...,
                         overwrite = TRUE,
                         recursive = dir.exists(from))
    } else {
        msg <- paste0("`", target, "` is newer than ", "`",
                      from, "`, skipping.")
        if (isTRUE(stop_on_error)) {
            throw(msg)
        } else {
            warning(msg)
            res <- FALSE
        }
    }
    return(invisible(res))
}
