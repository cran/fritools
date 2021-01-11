if (interactive()) pkgload::load_all(".")
test_wipe_clean <- function() {
    e <- new.env()
    assign("a", 1, envir = e)
    RUnit::checkIdentical(ls(envir = e), "a")
    result <- wipe_clean(envir = e)
    expectation <- "a"
    RUnit::checkIdentical(result, expectation)
    RUnit::checkIdentical(length(ls(envir = e)), 0L)
}
if (interactive()) {
    test_wipe_clean()
}
