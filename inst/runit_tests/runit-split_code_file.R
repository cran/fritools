if (interactive()) pkgload::load_all(".")
test_split_code_file <- function() {
    infile <- tempfile()
    file.copy(system.file("files", "test_helpers.R", package = "fritools"),
              infile)
    result <- basename(split_code_file(file = infile, write_to_disk = TRUE))
    expectation <- c("get_boolean_envvar.R",
                     "get_run_r_tests.R",
                     "is_running_on_fvafrcu_machines.R",
                     "is_running_on_gitlab_com.R",
                     "run_r_tests_for_known_hosts.R",
                     "set_run_r_tests.R")
    RUnit::checkIdentical(result, expectation)
}

if (interactive()) {
    test_split_code_file()
}
