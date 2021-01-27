\name{NEWS}
\title{NEWS}

\section{Changes in version 1.2.0}{
\itemize{
\item Skipping tests for \code{search_files()} if R has not at least version 4.0.0.
\item Add function \code{r_cmd_install()} as a quick alternative to \code{devtools::install()}.
\code{devtools} calling \code{callr}, calling \code{processx::run} seemed too bloated for
such a simple task.
\item Add function \code{compare_vectors()} which returns a side-by-side comparison of
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

