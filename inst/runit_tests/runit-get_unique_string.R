if (interactive()) pkgload::load_all(".")
test_get_unique_string <- function() {
    n <- 1000
    r <- replicate(n, get_unique_string())
    RUnit::checkIdentical(length(r), length(unique(r)))

}
if (interactive()) {
    test_get_unique_string()
}
