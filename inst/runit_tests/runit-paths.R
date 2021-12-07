if (interactive()) pkgload::load_all(".")
test_paths <- function() {
    x <- 3
    # no path set
    RUnit::checkException(get_path(x))
    # path is a directory
    RUnit::checkException(set_path(x, tempdir()))
    # path does not exists
    RUnit::checkException(set_path(x, tempfile()))
    # externally set path
    attr(x, "path") <- tempdir()
    # path is a directory
    RUnit::checkException(get_path(x))
    # create a file
    tempfile <- tempfile()
    touch(tempfile)
    # path already set
    RUnit::checkException(set_path(x, tempfile()))
    # overwrite
    x <- set_path(x, tempfile, overwrite = TRUE)
    result <- get_path(x)
    RUnit::checkIdentical(strip_off_attributes(result), tempfile)
    # csv
    a <- write_csv(mtcars, tempfile)
    RUnit::checkIdentical(get_mtime(a), file.mtime(tempfile))
    # change something
    a[1, 1] <- 0.0
    a <- write_csv(a)
    RUnit::checkIdentical(get_mtime(a), file.mtime(get_path(a)))
    # wrong path set
    attr(x, "path") <- tempfile()
     RUnit::checkException(get_path(x))
}

if (interactive()) {
    test_paths()
}
