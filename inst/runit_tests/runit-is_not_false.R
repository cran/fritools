if (interactive()) pkgload::load_all(".")
test_is_not_false <- function() {
    f <- function() {
        a <- FALSE
        return(is_not_false(a))
    }
    result <- f()
    expectation <- FALSE
    RUnit::checkIdentical(result, expectation)

    a  <- NULL
    result <- is_not_false(a)
    expectation <- FALSE
    RUnit::checkIdentical(result, expectation)
    result <- is_not_false(a, null_is_false = FALSE)
    expectation <- TRUE
    # FIXME: does not work in batch?!
    if (interactive())
        RUnit::checkIdentical(result, expectation)

    a  <- "not_false"
    # finds a in parent.frame()
    f <- function() {
        return(is_not_false(a))
    }
    result <- f()
    expectation <- TRUE
    # FIXME: does not work in batch?!
    if (interactive())
        RUnit::checkIdentical(result, expectation)

    # suppress search in parent.frame()
    f <- function() {
        return(is_not_false(a, null_is_false = TRUE,
                            inherits = FALSE))
    }
    result <- f()
    expectation <- FALSE
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_is_not_false()
}
