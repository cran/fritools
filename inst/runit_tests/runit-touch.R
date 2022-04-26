if (interactive()) pkgload::load_all(".")
test_touch <- function() {
    file1 <- tempfile()
    file2 <- tempfile()
    touch(file1, file2)
    t1 <- file.mtime(file1, file2)
    touch(file2)
    t2 <- file.mtime(file1, file2)
    RUnit::checkIdentical(t1 < t2, c(FALSE, TRUE))
    file <- file.path(tempfile(), "path", "not", "there.txt")
    touch(file)
    RUnit::checkTrue(file.exists(file))
}
if (interactive()) {
    test_touch()
}
test_touch2 <- function() {
    file1 <- tempfile()
    file2 <- tempfile()
    touch2(file1, file2)
    t1 <- file.mtime(file1, file2)
    touch2(file2)
    t2 <- file.mtime(file1, file2)
    RUnit::checkIdentical(t1 < t2, c(FALSE, TRUE))
    file <- file.path(tempfile(), "path", "not", "there.txt")
    touch2(file)
    RUnit::checkTrue(file.exists(file))
}
if (interactive()) {
    test_touch2()
}
