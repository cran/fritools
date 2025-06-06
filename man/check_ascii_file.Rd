% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/csv.R
\name{check_ascii_file}
\alias{check_ascii_file}
\title{Check the Number of Lines and Fields in a File}
\usage{
check_ascii_file(path, sep = ";")
}
\arguments{
\item{path}{Path to a file.}

\item{sep}{A character separating the fields in the file.}
}
\value{
A list giving the number of lines, number of fields and an boolean
indicating whether all lines have the same number of fields.
}
\description{
Check the Number of Lines and Fields in a File
}
\examples{
f <- tempfile()
write.csv2(mtcars, file = f)
check_ascii_file(f)
}
\seealso{
Other CSV functions: 
\code{\link{bulk_read_csv}()},
\code{\link{bulk_write_csv}()},
\code{\link{csv}},
\code{\link{csv2csv}()}
}
\concept{CSV functions}
