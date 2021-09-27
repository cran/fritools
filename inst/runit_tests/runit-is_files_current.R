if (interactive()) pkgload::load_all(".")
test_is_files_current <- function() {
    p1 <- tempfile()
    p2 <- tempfile()
    p3 <- tempfile()
    touch(p1)
    touch(p2)
    Sys.sleep(2)
    touch(p3)
    # one file
    RUnit::checkTrue(is_files_current(p3, newer_than = 1, units = "days",
                                      within = 4, within_units = "secs"))
    # more files
    RUnit::checkTrue(is_files_current(p1, p2, p3, newer_than = 1, units = "days",
                     within = 4, within_units = "secs"))
    # within not TRUE
    RUnit::checkTrue(!is_files_current(p1, p2, p3, newer_than = 1, units = "days",
                                       within = 1, within_units = "secs"))
    # newer not TRUE
    RUnit::checkTrue(!is_files_current(p1, p2, p3, newer_than = 1, units = "secs",
                                       within = 4, within_units = "secs"))
}
if (interactive()) {
    test_is_files_current()
} 
