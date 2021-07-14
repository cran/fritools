if (interactive()) pkgload::load_all(".")
test_is_success <- function() {
    result <- is_success(0)
    expectation <- TRUE
    RUnit::checkIdentical(result, expectation)
    result <- is_success(-1)
    expectation <- FALSE
    RUnit::checkIdentical(result, expectation)
}

if (interactive()) {
    test_is_success()
}
