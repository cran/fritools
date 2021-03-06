% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subsets.R
\name{index_groups}
\alias{index_groups}
\title{Determine Indices and Sizes of Subsets}
\usage{
index_groups(n, k)
}
\arguments{
\item{n}{The size of the set.}

\item{k}{The number of subsets.}
}
\value{
A matrix with starting index, size, and stopping index for each
subset.
}
\description{
Determine Indices and Sizes of Subsets
}
\examples{
index_groups(n = 100, k = 6)
index_groups(n = 2, k = 6)
}
