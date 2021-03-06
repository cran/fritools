% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_package_version.R
\name{get_package_version}
\alias{get_package_version}
\title{Query Installed Package Version}
\usage{
get_package_version(x, lib_loc = NULL)
}
\arguments{
\item{x}{A character giving the package name.}

\item{lib_loc}{See argument \code{lib.loc} in
\code{\link{packageDescription}}.}
}
\value{
A character giving the package version.
}
\description{
\code{\link{packageVersion}} converts to class \code{\link{package_version}},
which then again would need to be converted for \code{\link{compareVersion}}.
So this is a modified copy of \code{\link{packageVersion}} skipping the
conversion to \code{\link{package_version}}.
}
\examples{
get_package_version("base")
try(get_package_version("mgcv"))
}
