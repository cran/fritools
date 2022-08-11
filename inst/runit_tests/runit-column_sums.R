if (interactive()) pkgload::load_all(".")
test_column_sums <- function() {
    result <- column_sums(iris)
    expectation <- c(Sepal.Length = 876.5, Sepal.Width = 458.6,
                     Petal.Length = 563.7, Petal.Width = 179.9)
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_column_sums()
}
