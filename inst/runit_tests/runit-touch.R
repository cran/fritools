if (interactive()) pkgload::load_all(".")
test_touch <- function() {
    file <- tempfile()
    path <- touch(file)
    RUnit::checkIdentical(file, path)
    t1 <- file.mtime(file)
    touch(file)
    t2 <- file.mtime(file)
    RUnit::checkTrue(t1 < t2)
    file <- file.path(tempfile(), "path", "not", "there.txt")
    touch(file)
    RUnit::checkTrue(file.exists(file))
}
if (interactive()) {
    test_touch()
}
