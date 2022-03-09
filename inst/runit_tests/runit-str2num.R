if (interactive()) pkgload::load_all(".")
test_str2num <- function() {
    result <- str2num("1.000.000,11")
    expectation <- 1e06 + 0.11
    RUnit::checkEqualsNumeric(result, expectation)
    result <- str2num("not_a_number")
    RUnit::checkTrue(is.na(result))
}
if (interactive()) {
    test_str2num()
}
