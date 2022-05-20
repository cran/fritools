#' View a File or Directory
#'
#' Call \code{shell.exec} on windows, mimic \code{shell.exec}
#' otherwise.
#' @param path A path to a file or directory.
#' @param program A program to use.
#' @template return_invisibly_null
#' @family operating system functions
#' @export
#' @examples
#' path <- file.path(tempdir(), "foo.txt")
#' writeLines(c("abc", "xyz"), con = path)
#' view(path)
view <- function(path, program = NA) {
    if (interactive()) {
        if (!file.exists(path))
            throw(paste0("Can't find ", path, " on your system."))
        if (!is.na(program) && is_installed(program)) {
            system2(program, path, wait = FALSE)
        } else {
            if (fritools::is_windows()) {
                shell.exec(path)
            } else {
                qpath <- shQuote(path)
                if (fritools::is_installed("thunar"))
                    system2("thunar", qpath, wait = FALSE)
                else {
                    if (dir.exists(qpath)) {
                        list.files(qpath, full.names = TRUE)
                    } else {
                        throw(paste0("Don't know how to open ", qpath, "."))
                    }
                }
            }
        }
    } else {
        warning("You are in batch mode.")
    }
    return(invisible(NULL))
}
