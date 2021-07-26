% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_helpers.R
\name{get_boolean_envvar}
\alias{get_boolean_envvar}
\title{Get a Boolean Environment Variable}
\usage{
get_boolean_envvar(x, stop_on_failure = FALSE)
}
\arguments{
\item{x}{The name of the Environment Variable.}

\item{stop_on_failure}{Throw an error instead of returning
\code{\link{FALSE}} if the environment variable is not set or cannot be
converted to boolean.}
}
\value{
The value the environment variable is set to, converted to boolean.
\code{\link{FALSE}} if the environment variable is not set or cannot be
converted to boolean. But see \strong{Arguments}: \emph{stop_on_failure}.
}
\description{
A convenience wrapper to \code{\link{Sys.getenv}}.
}
\details{
As \code{\link{Sys.getenv}} seems to always return a character vector, the
\code{\link{class}} of the value you set it to does not matter.
}
\examples{
message("See\n example(\"get_run_r_tests\", package = \"fritools\")")
}
\seealso{
Other test helpers.: 
\code{\link{get_run_r_tests}()},
\code{\link{is_cran}()},
\code{\link{is_r_cmd_check}()},
\code{\link{is_running_on_fvafrcu_machines}()},
\code{\link{is_running_on_gitlab_com}()},
\code{\link{run_r_tests_for_known_hosts}()},
\code{\link{set_run_r_tests}()}

Other operating system functions.: 
\code{\link{get_run_r_tests}()},
\code{\link{is_installed}()},
\code{\link{is_r_package_installed}()},
\code{\link{is_success}()},
\code{\link{is_windows}()},
\code{\link{with_dir}()}
}
\concept{operating system functions.}
\concept{test helpers.}