\name{NEWS}
\title{NEWS}

\section{Changes in version 2.3.0}{
\itemize{
\item Added functions \code{is_files_current()} and \code{is_difftime_less()}.
\item Added function \code{is_valid_primary_key()} from \code{wehamr}.
\item Function \code{convert_umlauts_to_ascii()} now converts \code{rownames}, too.
}
}

\section{Changes in version 2.2.1}{
\itemize{
\item Fixed function \code{convert_umlauts_to_tex()}.
\item Fixed unit test that threw an error when running unit test on CRAN M1mac.
}
}

\section{Changes in version 2.2.0}{
\itemize{
\item Added functions to read an write (bulks of) CSV files.
\item Added \code{csv2csv()}, which converts German to standard CSV.
}
}

\section{Changes in version 2.1.0}{
\itemize{
\item Added \code{convert_umlauts_to_ascii()}.
\item Added \code{file_last_modified()}.
\item Added \code{is_cran()}, a copy of \code{fda::CRAN()}.
\item \code{touch()} now creates directories as needed.
\item \code{get_path()} and \code{set_path()} now throw errors, if a path to get is not set or
if a path to set is already set and argument \code{overwrite} is not \code{TRUE}.
}
}

\section{Changes in version 2.0.0}{
\itemize{
\item \strong{\code{search_files()} now throws an error if no matches are found.}
\item Added function \code{search_rows()}.
\item Added function \code{is_success()}.
\item Added function \code{convert_umlauts_to_tex()}.
}
}

\section{Changes in version 1.4.0}{
\itemize{
\item Added function \code{split_code_file()}.
\item Added function \code{weighted_variance()}.
\item Added function \code{tapply()} to fix the base version which will not digest
\code{data.frame}s as input.
}
}

\section{Changes in version 1.3.0}{
\itemize{
\item Extended \code{is_running_on_fvafrcu_machines()} to catch a new machine.
\item Added function \code{with_dir()} as this is often the only function I import from
package \code{withr} making \code{withr} a dependency.
\item Added function \code{get_boolean_envvar()}, \code{get_run_r_tests()} is
now a wrapper to that.
\item Added function \code{is_of_length_zero()}.
\item Added function \code{get_unique_string()}.
\item Added function \code{is_r_cmd_check()}.
\item Added function \code{run_r_tests_for_known_hosts()}.
\item Added functions \code{get_path()} and \code{set_path()}.
\item The \code{matrix} returned by \code{compare_vectors} now has named rows.
}
}

\section{Changes in version 1.2.0}{
\itemize{
\item Skipping tests for \code{search_files()} if R has not at least version 4.0.0.
\item Added function \code{r_cmd_install()} as a quick alternative to \code{devtools::install()}.
\code{devtools} calling \code{callr}, calling \code{processx::run} seemed too bloated for
such a simple task.
\item Added function \code{compare_vectors()} which returns a side-by-side comparison of
two vectors.
\item Updated test\_helper to recognize machines running at the Forest Research
Institute of the state of Baden-Wuerttemberg.
}
}

\section{Changes in version 1.1.0}{
\itemize{
\item Fixed buggy regular expression in \code{is_running_on_gitlab_com()}
\item Added \code{get_options}, \code{set_options}, \code{is_force};
\code{call_conditionally}, \code{call_safe};
\code{is_installed}, \code{is_r_package_installed};
\code{is_false}, \code{is_null_or_true};
\code{search_files}, \code{find_files}, \code{summary.filesearch} and
\code{strip_off_attributes}
from package \code{packager}.
}
}

\section{Changes in version 1.0.0}{
\itemize{
\item Got the compilation of utilities from
\itemize{
\item rasciidoc/R/utils.R: *
\item packager/R/is\_version\_sufficient.R: *
\item rasciidoc/R/is\_version\_sufficient.R: *
\item document/R/test\_helpers.R: *
\item fakemake/R/tools.R: *
\item cleanr/R/utils.R: *
\item bundeswaldinventur/R/utils.R: golden\_ratio()
\item cuutils/R/utils.R: *
\item cuutils/R/?.R: ?
\item packager/R/package\_version.R
}
}
}

