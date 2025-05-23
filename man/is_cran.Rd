% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_cran.R
\name{is_cran}
\alias{is_cran}
\title{Is '\R' Running on CRAN?}
\usage{
is_cran(cran_pattern, n_r_check4cran)
}
\arguments{
\item{cran_pattern}{A regular expressions to apply to the names of
\code{Sys.getenv()}
   to identify possible CRAN parameters.  Defaults to
   \code{Sys.getenv('_CRAN_pattern_')} if available and '^_R_' if not.}

\item{n_r_check4cran}{Assume this is CRAN if at least n_R_CHECK4CRAN
elements of
   \code{Sys.getenv()} have names matching x.  Defaults to
   \code{Sys.getenv('_n_R_CHECK4CRAN_')} if available and 5 if not.}
}
\value{
A logical scalar with attributes \samp{'sys_getenv'} containing the
 results of \code{Sys.getenv()} and 'matches' containing \code{i} per step 3
 above.
}
\description{
\emph{This is a verbatim copy of \code{fda::CRAN} of
\pkg{fda} version 5.1.9.}
}
\details{
This function allows package developers to run tests themselves that
 should not run on CRAN or with \preformatted{R CMD check --as-cran} because
 of compute time constraints with CRAN tests.

 The "Writing R Extensions" manual says that \command{R CMD check} can be
 customized "by setting environment variables _R_CHECK_*_:, as
 described in" the Tools section of the "R Internals" manual.

 \command{R CMD check} was tested with R 3.0.1 under Fedora 18 Linux and with
 \command{Rtools} 3.0 from April 16, 2013 under Windows 7.  With the
 \preformatted{'--as-cran'}
 option, 7 matches were found;  without it, only 3 were found.  These
 numbers were unaffected by the presence or absence of the '--timings'
 parameter.  On this basis, the default value of n_R_CHECK4CRAN was set
 at 5.

 1.  \code{x. <- Sys.getenv()}

 2.  Fix \code{CRAN_pattern} and \code{n_R_CHECK4CRAN} if missing.

 3.  Let i be the indices of x. whose names match all the patterns in
 the vector x.

 4.  Assume this is CRAN if length(i) >= n_R_CHECK4CRAN
}
\examples{
if (!is_cran()) {
    message("Run your tests here.")
}
}
\seealso{
Other test helpers: 
\code{\link{develop_test}()},
\code{\link{get_boolean_envvar}()},
\code{\link{get_run_r_tests}()},
\code{\link{is_r_cmd_check}()},
\code{\link{is_running_on_fvafrcu_machines}()},
\code{\link{is_running_on_gitlab_com}()},
\code{\link{run_r_tests_for_known_hosts}()},
\code{\link{set_run_r_tests}()}

Other logical helpers: 
\code{\link{get_run_r_tests}()},
\code{\link{is_batch}()},
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
\code{\link{is_success}()},
\code{\link{is_true}()},
\code{\link{is_version_sufficient}()},
\code{\link{is_windows}()}
}
\concept{logical helpers}
\concept{test helpers}
