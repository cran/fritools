if (interactive()) pkgload::load_all(".")
test_golden_ratio <- function() {
    gr <- ((1 + sqrt(5)) / 2)
    expectation <- list(a = 1, b = gr - 1)
    result <- golden_ratio(gr)
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_golden_ratio()
}
