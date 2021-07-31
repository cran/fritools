if (interactive()) pkgload::load_all(".")
if (run_r_tests_for_known_hosts()) {
    test_with_dir <- function() {
        expectation <- normalizePath(tempdir(), mustWork = FALSE)
        result <- normalizePath(with_dir(expectation, getwd()))

        RUnit::checkIdentical(expectation, result)
    }
    if (interactive()) {
        test_with_dir()
    }
}
