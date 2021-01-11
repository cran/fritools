if (interactive()) pkgload::load_all(".")
test_is_version_sufficient <- function() {
    result <- is_version_sufficient(installed = "1.0.0", required = "2.0.0")
    RUnit::checkIdentical(result, FALSE)
    result <- is_version_sufficient(installed = "1.0.0", required = "1.0.0")
    RUnit::checkIdentical(result, TRUE)
    result <- is_version_sufficient(installed = "1.0.1", required = "1.0.0")
    RUnit::checkIdentical(result, TRUE)
}
if (interactive()) {
    test_is_version_sufficient()
}
