% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/touch.R
\name{touch}
\alias{touch}
\title{Mock the Unix \command{touch} utility}
\usage{
touch(path)
}
\arguments{
\item{path}{Path to the file to be touched.}
}
\value{
The Path to the file touched.
}
\description{
Creating a file or ensuring a file's modification time changes.
}
\examples{
file <- tempfile()
touch(file)
t1 <- file.mtime(file)
touch(file)
t2 <- file.mtime(file)
t1 < t2
}
