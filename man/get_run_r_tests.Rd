% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_helpers.R
\name{get_run_r_tests}
\alias{get_run_r_tests}
\title{Get System Variable RUN_R_TESTS}
\usage{
get_run_r_tests(stop_on_failure = FALSE)
}
\arguments{
\item{stop_on_failure}{Throw an error instead of returning
\code{\link{FALSE}} if RUN_R_TESTS is not set or cannot be converted to
boolean.}
}
\value{
The value RUN_R_TESTS is set to, converted to boolean.
\code{\link{FALSE}} if RUN_R_TESTS is not set or cannot be converted to
boolean.
}
\description{
Convenience wrapper to \code{\link{Sys.getenv}}.
}
\details{
As \code{\link{Sys.getenv}} seems to always return a character vector, the
\code{\link{class}} of the value you set it to does not matter.
}
\examples{
set_run_r_tests("", force = TRUE) # make sure it is not set.
try(get_run_r_tests())
set_run_r_tests("A", force = TRUE) # "A" is not boolean.
try(get_run_r_tests())
set_run_r_tests(4213, force = TRUE) # All numbers apart from 0 are TRUE
get_run_r_tests()
set_run_r_tests("0", force = TRUE) # 0 (and "0") is FALSE
get_run_r_tests()
set_run_r_tests("FALSE", force = TRUE)
get_run_r_tests()
set_run_r_tests(TRUE, force = TRUE)
get_run_r_tests()
}
\seealso{
Other test helpers: 
\code{\link{is_running_on_fvafrcu_machines}()},
\code{\link{is_running_on_gitlab_com}()},
\code{\link{set_run_r_tests}()}
}
\concept{test helpers}