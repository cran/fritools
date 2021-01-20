if (interactive()) pkgload::load_all(".")
test_load_internal_functions <- function() {
    load_internal_functions("fritools")
    result <- environmentName(environment(throw))
    expectation <- "fritools"
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_load_internal_functions()
}
