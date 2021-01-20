#' Find Files on Disk
#'
#' Look for files on disk, either scanning a vector of names or searching for
#' files with \code{\link{list.files}} and throw an error if no files are found.
#'
#' @param file_names character vector of file names (to be checked if the files
#'        exist).
#' @param path see \code{\link{list.files}}.
#' @param pattern see \code{\link{list.files}}.
#' @param all_files see \code{\link{list.files}}, argument \code{all.files}.
#' @param recursive see \code{\link{list.files}}.
#' @param ignore_case see \code{\link{list.files}}, argument \code{ignore.case}.
#' @param find_all Throw an error if not all files (given by \emph{file_names}
#' are found?
#'
#' @note This is merely a wrapper around \code{\link{file.exists}} or
#'       \code{\link{list.files}}, depending on whether \emph{file_names} is
#'       given.
#'
#' @export
#' @family file searching functions
#' @return a character vector of file names.
#' @examples
#' #% create some files
#' files <- unname(sapply(file.path(tempdir(), paste0(sample(letters, 10),
#'                                               ".", c("R", "Rnw", "txt"))),
#'                        touch))
#' print(files)
#' print(list.files(tempdir(), full.names = TRUE)) # same as above
#' #% file names given
#' find_files(file_names = files[1:3])
#' ##% some do not exist:
#' find_files(file_names = c(files[1:3], replicate(2, tempfile())))
#' try(find_files(file_names = c(files[1:3], replicate(2, tempfile())),
#'                find_all = TRUE))
#' ##% all do not exist:
#' try(find_files(file_names = replicate(2, tempfile())))
#' #% path given
#' find_files(path = tempdir())
#' ##% change pattern
#' find_files(path = tempdir(),
#'            pattern = ".*\\.[RrSs]$|.*\\.[RrSs]nw$|.*\\.txt")
#' ##% find a specific file by it's basename
#' find_files(path = tempdir(), pattern = paste0("^", basename(files[1]), "$"))
#' #% file_names and path given: file_names beats path
#' try(find_files(file_names = tempfile(), path = tempdir()))
find_files <- function(file_names = NA, path = ".",
                       pattern = ".*\\.[RrSs]$|.*\\.[RrSs]nw$",
                       all_files = TRUE, recursive = TRUE,
                       ignore_case = FALSE, find_all = FALSE) {
    if (isTRUE(is.na(file_names))) {
        file_paths <- list.files(path = path, pattern = pattern,
                                  all.files = all_files,
                                  recursive = recursive,
                                  ignore.case = ignore_case,
                                  full.names = TRUE,
                                  include.dirs = FALSE, no.. = TRUE)
    } else {
        files_exist <- file.exists(file_names)
        msg <- paste(paste("File", file_names[! files_exist], " not found."),
                      collapse = "\n\t")

        if (! all(files_exist)) {
            if (isTRUE(find_all)) {
                throw(msg)
            } else {
                warning(msg)
                file_paths <- file_names[files_exist]
            }
        } else {
            file_paths <- file_names[files_exist]
        }

    }
    if (length(file_paths) == 0) throw("No matching files found.")
    return(sort(file_paths))
}
