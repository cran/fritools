if (interactive()) pkgload::load_all(".")
test_get_package_version <- function() {
    v <- get_package_version("base")
    RUnit::checkTrue(is(package_version(v), "package_version"))
    RUnit::checkException(get_package_version("no_package"))
}
if (interactive()) {
    test_get_package_version()
}
