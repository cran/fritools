% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/installed.R
\name{is_r_package_installed}
\alias{is_r_package_installed}
\title{Is an '\R' Package Installed?}
\usage{
is_r_package_installed(x, version = "0")
}
\arguments{
\item{x}{Name of the package as character string.}

\item{version}{Required minimum version of the package as character string.}
}
\value{
\code{\link[base:TRUE]{TRUE}} on success, 
\code{\link[base:FALSE]{FALSE}} otherwise.
}
\description{
Is an \R package installed?
}
\examples{
is_r_package_installed("base", "300.0.0")
is_r_package_installed("fritools", "1.0.0")
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
\code{\link{is_running_on_fvafrcu_machines}()},
\code{\link{is_running_on_gitlab_com}()},
\code{\link{is_scalar}()},
\code{\link{is_scalar_convertible2numeric}()},
\code{\link{is_success}()},
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
\code{\link{is_success}()},
\code{\link{is_windows}()},
\code{\link{view}()},
\code{\link{vim}()},
\code{\link{wipe_tempdir}()},
\code{\link{with_dir}()}

Other package functions: 
\code{\link{get_package_version}()},
\code{\link{is_version_sufficient}()},
\code{\link{load_internal_functions}()},
\code{\link{rename_package}()}

Other version functions: 
\code{\link{get_package_version}()},
\code{\link{get_session_string}()},
\code{\link{is_version_sufficient}()}
}
\concept{logical helpers}
\concept{operating system functions}
\concept{package functions}
\concept{version functions}
