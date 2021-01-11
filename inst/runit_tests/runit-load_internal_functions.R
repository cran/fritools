if (interactive()) pkgload::load_all(".")
test_load_internal_functions <- function() {
    load_internal_functions("fritools")
    result <- ls()
    expectation <- "throw"
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_load_internal_functions()
}
