if (interactive()) pkgload::load_all(".")
test_is_path <- function() {
    RUnit::checkTrue(is_path(tempdir()))
    path <- tempfile()
    RUnit::checkTrue(!is_path(path))
    touch(path)
    RUnit::checkTrue(is_path(path))
}
if (interactive()) {
    test_is_path()
}
