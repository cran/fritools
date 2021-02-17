if (interactive()) pkgload::load_all(".")
test_is_running <- function() {
    message("These functions can't be tested, as the result differs on",
            "different machines")
    expectation <- if (result <- is_running_on_fvafrcu_machines()) {
        TRUE
    } else {
        FALSE
    }
    RUnit::checkIdentical(result, expectation)

    ## this is tested direct via .gitlab-ci/gitlab-com.R and a call to it in
    ## .gitlab-ci.yml
    expectation <- if (result <- is_running_on_gitlab_com()) {
        TRUE
    } else {
        FALSE
    }
    attributes(result) <- NULL

    RUnit::checkIdentical(result, expectation)

    # Well, that's ...
    result <- run_r_tests_for_known_hosts()
    expectation <-
        is_running_on_gitlab_com(verbose = FALSE) ||
        is_running_on_fvafrcu_machines()
    RUnit::checkIdentical(result, expectation)

}
if (interactive()) {
    test_is_running()
}
test_run_r_test <- function() {
    set_run_r_tests("", force = TRUE) # make sure it is not set.
    #% get unset option
    RUnit::checkIdentical(get_run_r_tests(), FALSE)
    RUnit::checkException(get_run_r_tests(stop_on_failure = TRUE))

    #% set option
    set_run_r_tests("", force = TRUE) # make sure it is not set.
    RUnit::checkIdentical(set_run_r_tests(12), 12)
    RUnit::checkIdentical(set_run_r_tests("12", force = TRUE), "12")
    RUnit::checkIdentical(set_run_r_tests(TRUE), NULL)


    #% get set option
    ##% passing
    set_run_r_tests(4213, force = TRUE) # All numbers apart from 0 are TRUE
    RUnit::checkTrue(get_run_r_tests())
    set_run_r_tests("4213", force = TRUE) # All numbers apart from 0 are TRUE
    RUnit::checkTrue(get_run_r_tests())
    set_run_r_tests(TRUE, force = TRUE)
    RUnit::checkTrue(get_run_r_tests())
    set_run_r_tests("TRUE", force = TRUE)
    RUnit::checkTrue(get_run_r_tests())

    ##% failing
    set_run_r_tests("A", force = TRUE) # "A" is not boolean.
    RUnit::checkIdentical(get_run_r_tests(), FALSE)
    RUnit::checkException(get_run_r_tests(stop_on_failure = TRUE))
    set_run_r_tests("0", force = TRUE) # 0 (and "0") is FALSE
    RUnit::checkIdentical(get_run_r_tests(), FALSE)
    set_run_r_tests(0, force = TRUE) # 0 (and "0") is FALSE
    RUnit::checkIdentical(get_run_r_tests(), FALSE)

    set_run_r_tests("FALSE", force = TRUE)
    RUnit::checkIdentical(get_run_r_tests(), FALSE)
    set_run_r_tests(FALSE, force = TRUE)
    RUnit::checkIdentical(get_run_r_tests(), FALSE)
}
