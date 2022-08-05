if (interactive()) pkgload::load_all(".")
test_count_groups <- function() {
    result <- count_groups(mtcars, "am", "gear")
    expectation <- structure(list(am = c(0, 0, 1, 1),
                                  gear = c(3, 4, 4, 5),
                                  count = c(15L, 4L, 8L, 5L)),
                             row.names = c(NA, -4L), class = "data.frame")
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_count_groups()
}
