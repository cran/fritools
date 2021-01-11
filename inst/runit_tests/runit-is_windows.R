if (interactive()) pkgload::load_all(".")
test_is_windows <- function() {
    result <- is_windows()
    expectation <- checkmate::test_os("windows")
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_is_windows()
}
