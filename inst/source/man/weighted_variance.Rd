% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weighted_variance.R
\name{weighted_variance}
\alias{weighted_variance}
\alias{weighted_variance.numeric}
\alias{weighted_variance.data.frame}
\title{Calculate a Weighted Variance}
\usage{
weighted_variance(x, ...)

\method{weighted_variance}{numeric}(x, weights, weights_counts = NULL, ...)

\method{weighted_variance}{data.frame}(x, var, weight, ...)
}
\arguments{
\item{x}{A numeric \code{\link{vector}} or \code{\link{data.frame}}.}

\item{...}{Other arguments ignored.}

\item{weights}{A vector of weights.}

\item{weights_counts}{Are the weights counts of the data? If so, we can
calculate the unbiased sample variance, otherwise we calculate the biased
(maximum likelihood estimator of the) sample variance.}

\item{var}{The name of the column in \code{x} giving the variable of
interest.}

\item{weight}{The name of the column in \code{x} giving the weights.}
}
\description{
Calculate a weighted variance.
}
\details{
The  \code{\link{data.frame}} method is meant for use with
\code{\link{tapply}}, see \emph{examples}.
}
\examples{
## GPA from Siegel 1994
wt <- c(5,  5,  4,  1)/15
x <- c(3.7,3.3,3.5,2.8)
var(x)
weighted_variance(x = x)
weighted_variance(x = x, weights = wt)
weighted_variance(x = x, weights = wt, weights_counts = TRUE)
weights <- c(5,  5,  4,  1)
weighted_variance(x = x, weights = weights)
weighted_variance(x = x, weights = weights, weights_counts = FALSE)
weighted_variance(x = data.frame(x, wt), var = "x",
                             weight = "wt")
# apply by groups:
fritools::tapply(object = mtcars,
                 index = list(mtcars[["cyl"]], mtcars[["vs"]]),
                 func = weighted_variance, var = "mpg", w = "wt")
}
\seealso{
Other statistics: 
\code{\link{column_sums}()},
\code{\link{count_groups}()},
\code{\link{relative_difference}()},
\code{\link{round_half_away_from_zero}()}
}
\concept{statistics}
