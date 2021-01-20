if (interactive()) pkgload::load_all(".")
test_strip <- function() {
    x <- 1:3
    y <- stats::setNames(x, letters[1:3])
    attr(y, "myattr") <- "qwer"
    comment(y) <- "qwer"
    RUnit::checkIdentical(x, strip_off_attributes(y))
}
if (interactive()) {
    test_strip()
}
