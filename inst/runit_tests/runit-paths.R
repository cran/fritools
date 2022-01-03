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

test_path_times <- function() {
    x <- mtcars
    RUnit::checkException(get_mtime(x))
    tempfile <- tempfile()
    touch(tempfile)
    x <- set_path(x, tempfile)
    RUnit::checkTrue(file.mtime(tempfile) == get_mtime(x))
    RUnit::checkTrue(is(get_mtime(x), "POSIXt"))
    result <- get_path(x)
    RUnit::checkTrue(is_path(result))
    RUnit::checkTrue(is(attr(result, "mtime"), "POSIXt"))
    RUnit::checkTrue(is.na(attr(result, "last_read")))
    RUnit::checkTrue(is.na(attr(result, "last_written")))
    Sys.sleep(1)
    touch(tempfile)
    RUnit::checkTrue(file.mtime(tempfile) > get_mtime(x))
    Sys.sleep(1)
    x <- write_csv(x)
    RUnit::checkIdentical(file.mtime(tempfile), get_mtime(x))
    RUnit::checkEquals(as.character(get_mtime(x)),
                       as.character(attr(get_path(x), "last_written")))
    RUnit::checkTrue(is.na(attr(result, "last_read")))
    Sys.sleep(1)
    y <- read_csv(tempfile)
    RUnit::checkTrue(get_mtime(y) < attr(get_path(y), "last_read"))
    RUnit::checkTrue(is.na(attr(get_path(y), "last_written")))
    # Now we change it:
    y[1, 2] <- y[1, 2] + 1
    Sys.sleep(1)
    y <- write_csv(y)
    RUnit::checkEquals(as.character(get_mtime(x)),
                       as.character(attr(get_path(x), "last_written")))
    # Now this is ... a feature: it hasn't changed on disc, because the content
    # doesn't change:
    Sys.sleep(1)
    y <- write_csv(y)
    RUnit::checkTrue(get_mtime(y) < attr(get_path(y), "last_written"))
}
if (interactive()) {
    test_path_times()
}
