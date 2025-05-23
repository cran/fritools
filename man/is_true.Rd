% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_true.R
\name{is_true}
\alias{is_true}
\title{Convert a \code{\link{logical}} Array to a Binary Boolean Array}
\usage{
is_true(x)
}
\arguments{
\item{x}{An \code{\link{logical}} array, probably the result of some
kind of mathematical expression.}
}
\value{
A binary boolean array indicating where the \code{\link{logical}}
array is \code{\link[base:isTRUE]{TRUE}}.
}
\description{
I often use mathematical expressions to index data by its values. But when
the data contain missing values, the logical indices do not index the data,
so I need to convert them to boolean.
}
\examples{
x <- array(1:24, dim = c(2,3,4))
x[2,2,3] <- NA
print(x)
x < 20 # An array containing NA
is_true(x < 20) # An array boolean only, NA converted to FALSE
print(x <- x[2, TRUE, TRUE])
is_true(x < 20) # A matrix
x <- x[2, TRUE]
is_true(x < 20) # A vector
x <- x[3]
is_true(x < 20) # A scalar
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
\code{\link{is_success}()},
\code{\link{is_version_sufficient}()},
\code{\link{is_windows}()}
}
\concept{logical helpers}
