test_exception <- function() {
    RUnit::checkException(fritools:::throw("Hello, error!"))
}
