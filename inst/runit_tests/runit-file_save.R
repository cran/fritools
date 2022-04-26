if (interactive()) pkgload::load_all(".")
test_file_save <- function() {
    f <- file.path(tempfile())
    RUnit::checkIdentical(file_save(f, stop_on_error = FALSE), FALSE)
    RUnit::checkException(file_save(f))
    touch(f)
    RUnit::checkIdentical(file_save(f, force = FALSE), FALSE)
    RUnit::checkIdentical(length(dir(dirname(f), pattern = basename(f))), 1L)
    file_save(f, recursive = FALSE)
    RUnit::checkIdentical(length(dir(dirname(f), pattern = basename(f))), 2L)
    f1 <- paste0(f, ".txt")
    touch(f1)
    RUnit::checkIdentical(length(dir(dirname(f), pattern = basename(f))), 3L)
    file_save(f1)
    RUnit::checkIdentical(length(dir(dirname(f), pattern = basename(f))), 4L)
    # now both files already exist
    RUnit::checkTrue(any(file_save(f, f1), overwrite = TRUE))
    RUnit::checkTrue(!any(file_save(f, f1)))
}
if (interactive()) {
    test_file_save()
}
