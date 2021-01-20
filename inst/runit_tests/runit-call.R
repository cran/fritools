if (interactive()) pkgload::load_all(".")
test_call_conditionally <- function() {
    result <- call_conditionally(get_package_version,
                                 condition = TRUE,
                                 args = list(x = "fritools"),
                                 fallback = "0.0")
    expectation <- get_package_version("fritools")
    RUnit::checkIdentical(result, expectation)
    call_conditionally(get_package_version,
                       condition = FALSE,
                       args = list(x = "fritools"),
                       fallback = "0.0")
    result <- call_conditionally(get_package_version,
                                 condition = FALSE,
                                 args = list(x = "fritools"),
                                 fallback = "0.0")
    expectation <- "0.0"
    RUnit::checkIdentical(result, expectation)
    result <- call_conditionally(get_package_version,
                       condition = TRUE,
                       args = list(x = "not_there"),
                       harden = TRUE,
                       fallback = "-1")
    expectation <- "-1"
    RUnit::checkIdentical(result, expectation)

    RUnit::checkException(call_conditionally(get_package_version,
                                             condition = TRUE,
                                             args = list(x = "not_there"),
                                             harden = FALSE,
                                             fallback = "-1"))
}
if (interactive()) {
    test_call_conditionally()
}
