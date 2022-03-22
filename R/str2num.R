#' Convert Character Numbers to Numeric
#'
#' If you read text containing  (possibly German, i.e. the decimals separated by
#' comma and dots inserted for what they think of as readability) numbers, you
#' may want to convert them to numeric.
#' @param x A string representing a (possibly German) number.
#' @return The number as a numeric.
#' @export
#' @family bits and pieces
#' @examples
#' line_in_text <- "foo bar 10.303,70 foo bar  1.211.000,55 foo bar"
#' words <- unlist(strsplit(line_in_text, split = " "))
#' print(na.omit(sapply(words, str2num)), digits = 9)
#' print(str2num(words[7]), digits = 9)
str2num <- function(x) {
  res <- suppressWarnings(as.numeric(sub(" .*", "", sub(",", ".",
                                                        gsub("\\.", "", x)))))
  res <- res[!is.na(res)]
  if (is_of_length_zero(res)) res <- NA
  return(res)
}
