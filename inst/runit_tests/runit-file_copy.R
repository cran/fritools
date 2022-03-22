if (interactive()) pkgload::load_all(".")
test_file_copy <- function() {
    f1 <- file.path(tempdir(), "first.R")
    f2 <- file.path(tempdir(), "second.R")
    RUnit::checkTrue(isFALSE(file_copy(f2, f1)))
    touch(f1)
    touch(f2)
    touch(f2) # make sure that f2 is newer than f1
    RUnit::checkTrue(isFALSE(file_copy(f1, f2, stop_on_error = FALSE)))
    RUnit::checkException(file_copy(f1, f2, stop_on_error = TRUE))
    RUnit::checkTrue(file_copy(f2, f1))
    file_names <- list.files(tempdir(), pattern = "first.*\\.R")
    RUnit::checkIdentical(length(file_names), 2L)
    pattern <- "first_[0-9]{4}_[0-9]{2}_[0-9]{2}_[0-9]{2}_[0-9]{2}_[0-9]{2}\\.R"
    RUnit::checkTrue(any(grepl(pattern, file_names)))
    dir <- file.path(tempdir(), "subdir")
    dir.create(dir)
    file_copy(f1, dir)
    file_names <- list.files(dir, pattern = "first.*\\.R")
    RUnit::checkIdentical(length(file_names), 1L)
    RUnit::checkIdentical("first.R", file_names)
    touch(f1)
    RUnit::checkTrue(file_copy(f1, dir))
    file_names <- list.files(dir, pattern = "first.*\\.R")
    RUnit::checkIdentical(length(file_names), 2L)
    RUnit::checkTrue(any(grepl(pattern, file_names)))

}
if (interactive()) {
    test_file_copy()
}
