if (interactive()) pkgload::load_all(".")
test_is_difftime_less <- function() {
    a <- as.POSIXct(0, origin = "1970-01-01", tz = "GMT")
    b <- as.POSIXct(60*60*24, origin = "1970-01-01", tz = "GMT")
    c <- as.POSIXct(60*60*24 - 1, origin = "1970-01-01", tz = "GMT")
    RUnit::checkTrue(!is_difftime_less(a, b, verbose = TRUE))
    RUnit::checkTrue(is_difftime_less(a, c, verbose = TRUE))
    RUnit::checkException(is_difftime_less(a, b, verbose = TRUE,
                                           stop_on_error = TRUE))
    RUnit::checkTrue(is_difftime_less(a, c, verbose = TRUE, 
                                      stop_on_error = TRUE))
}
if (interactive()) {
    test_is_difftime_less()
} 
