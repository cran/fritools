if (interactive()) pkgload::load_all(".")
test_find_files <- function() {
    #% create some files
    temp_dir <- tempfile()
    if (interactive()) unlink(temp_dir, recursive = TRUE)
    path <- file.path(temp_dir, "foo")
    dir.create(path, recursive = TRUE)
    files <- sort(unname(sapply(file.path(path,
                                          paste0(sample(letters, 10),
                                                 ".", c("R", "Rnw", "txt"))),
                                touch)))
    result <- files
    expectation <- list.files(path, full.names = TRUE)
    RUnit::checkIdentical(result, expectation)
    #% file names given
    expectation <- files[1:3]
    result <- find_files(file_names = files[1:3])
    RUnit::checkIdentical(result, expectation)
    ##% some do not exist:
    not_there <- replicate(2, tempfile())
    result <- suppressWarnings(find_files(file_names = c(files[1:3],
                                                         not_there)))
    RUnit::checkIdentical(result, expectation)
    ###% check for warning
    result <- tryCatch(find_files(file_names = c(files[1:3], not_there)),
                       warning = function(w) return(w))[["message"]]
    expectation <- paste(paste("File", not_there, " not found."),
                         collapse = "\n\t")
    RUnit::checkIdentical(result, expectation)

    ###% check for find_all
    RUnit::checkException(find_files(file_names = c(files[1:3], not_there),
                                     find_all = TRUE))
    ##% all do not exist:
    RUnit::checkException(find_files(file_names = replicate(2, tempfile())))
    #% path given
    result <- find_files(path = temp_dir, recursive = TRUE)
    expectation <- grep("\\.R$|\\.Rnw$", files, value = TRUE)
    RUnit::checkIdentical(result, expectation)
    ##% none found (by not searching recursively):
    RUnit::checkException(find_files(path = temp_dir, recursive = FALSE))
    ##% change pattern
    result <- find_files(path = temp_dir,
                         pattern = ".*\\.[RrSs]$|.*\\.[RrSs]nw$|.*\\.txt",
                         recursive = TRUE)
    expectation <- files
    RUnit::checkIdentical(result, expectation)
    ##% find a specific file by it's basename
    result <- find_files(path = path, pattern = paste0("^",
                                                       basename(files[1]), "$"))
    expectation <- files[1]
    RUnit::checkIdentical(result, expectation)
    #% file_names and path given: file_names beats path
    result <- find_files(file_names = files[1], path = temp_dir)
    expectation <- files[1]
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_find_files()
}
