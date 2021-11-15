if (interactive()) pkgload::load_all(".")
test_is_installed <- function() {
    if (is_running_on_fvafrcu_machines() || is_running_on_gitlab_com()) {
        # NOTE: There are CRAN machines where neither "R" nor "R-devel" is in
        # the path, so we skipt this test on unkown machines.
        RUnit::checkTrue(is_installed("R"))
    }
    RUnit::checkTrue(!is_installed("This_program_is_not_installed"))
}
if (interactive()) {
    test_is_installed()
}
test_is_r_package_installed <- function() {
    RUnit::checkTrue(is_r_package_installed("fritools", "1.1.0"))
    RUnit::checkTrue(!is_r_package_installed("fritools", "9999"))
}
