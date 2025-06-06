% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boolean.R
\name{is_not_false}
\alias{is_not_false}
\title{Is an Object Set and not Set to \code{\link[base:FALSE]{FALSE}}?}
\usage{
is_not_false(x, null_is_false = TRUE, ...)
}
\arguments{
\item{x}{The object to be tested.}

\item{null_is_false}{Should \code{\link[base:NULL]{NULL}} be treated as
\code{\link[base:FALSE]{FALSE}}?}

\item{...}{Parameters passed to \code{\link{exists}}. See Examples.}
}
\value{
\code{\link[base:TRUE]{TRUE}} if the object is set to something
different than \code{\link[base:FALSE]{FALSE}},
\code{\link[base:FALSE]{FALSE}}
otherwise.
}
\description{
Sometimes you need to know whether or not an object exists and is not set to
\code{\link[base:FALSE]{FALSE}} (and possibly not
\code{\link[base:NULL]{NULL}}).
}
\examples{
a  <- 1
b  <- FALSE
c  <- NULL
is_not_false(a)
is_not_false(b)
is_not_false(c)
is_not_false(c, null_is_false = FALSE)
is_not_false(not_defined)
f <- function() {
    print(a)
    print(is_not_false(a))
}
f()

f <- function() {
    a <- FALSE
    print(a)
    print(is_not_false(a))
}
f()

f <- function() {
    print(a)
    print(is_not_false(a, null_is_false = TRUE,
                       inherits = FALSE))
}
f()
### We use this to check whether an option is set to something
### different than FALSE:
# Make sure an option is not set:
set_options("test" = NULL, package = "fritools")
tmp <- get_options("test")
is_not_false(tmp)
is_not_false(tmp, null_is_false = FALSE)
# Does not work on the option directly as it is not an object defined:
options("foo" = NULL)
is_not_false(getOption("foo"), null_is_false = FALSE)
}
\seealso{
Other logical helpers: 
\code{\link{get_run_r_tests}()},
\code{\link{is_batch}()},
\code{\link{is_cran}()},
\code{\link{is_false}()},
\code{\link{is_force}()},
\code{\link{is_installed}()},
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
