if (interactive()) pkgload::load_all(".")
test_is_cran <- function() {
    result <- is_cran()
    if (is_running_on_fvafrcu_machines()) {
        if (fritools::is_r_cmd_check()) {
            RUnit::checkTrue(strip_off_attributes(result))
        } else {
            RUnit::checkTrue(strip_off_attributes(!result))
        }
    }

}
if (interactive()) {
    test_is_cran()
}
