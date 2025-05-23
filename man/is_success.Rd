% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_success.R
\name{is_success}
\alias{is_success}
\title{Does the Return Value of a Command Signal Success?}
\usage{
is_success(x)
}
\arguments{
\item{x}{The external commands return value.}
}
\value{
\code{\link[base:TRUE]{TRUE}} on success, 
\code{\link[base:FALSE]{FALSE}} otherwise.
}
\description{
This is just a wrapper to ease the evaluation of return values from external
commands:
External commands return 0 on success, which is
\code{\link[base:FALSE]{FALSE}}, when converted to logical.
}
\examples{
is_success(0)
is_success(1)
is_success(-1)
}
\seealso{
Other logical helpers: 
\code{\link{get_run_r_tests}()},
\code{\link{is_batch}()},
\code{\link{is_cran}()},
\code{\link{is_false}()},
\code{\link{is_force}()},
\code{\link{is_installed}()},
\code{\link{is_not_false}()},
\code{\link{is_null_or_true}()},
\code{\link{is_of_length_zero}()},
\code{\link{is_r_cmd_check}()},
\code{\link{is_r_package_installed}()},
\code{\link{is_running_on_fvafrcu_machines}()},
\code{\link{is_running_on_gitlab_com}()},
\code{\link{is_scalar}()},
\code{\link{is_scalar_convertible2numeric}()},
\code{\link{is_true}()},
\code{\link{is_version_sufficient}()},
\code{\link{is_windows}()}

Other operating system functions: 
\code{\link{clipboard_path}()},
\code{\link{file_copy}()},
\code{\link{file_save}()},
\code{\link{get_boolean_envvar}()},
\code{\link{get_run_r_tests}()},
\code{\link{is_installed}()},
\code{\link{is_r_package_installed}()},
\code{\link{is_windows}()},
\code{\link{view}()},
\code{\link{vim}()},
\code{\link{wipe_tempdir}()},
\code{\link{with_dir}()}
}
\concept{logical helpers}
\concept{operating system functions}
