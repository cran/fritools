#' Extract All Items of a Vector Between Two Patterns
#'
#' This comes in handy to cut lines from a file read by \code{\link{read.csv}}.
#' @param x A vector.
#' @param from A pattern.
#' @param to Another pattern.
#' @param from_i If the from pattern matches multiple times, which one is to be
#' used.
#' @param to_i Analogously to to_i.
#' @param shift_from The number of items to shift from the item selected via
#' from and from_i.
#' @param shift_to Analogously to shift_from.
#' @param remove_empty_item Remove empty items?
#' @return The extracted vector.
#' @family searching functions
#' @export
#' @examples
#' foo <- c("f1", "A", "f2", rep("B", 4), "t1", "f3", "C", "t2",
#'          rep("D", 4), "t3")
#' fromto(foo, "^f", "^t")
#' fromto(foo, "^f", "^t", from_i = 2)
#' fromto(foo, "^f", "^t", from_i = 2, to_i = 2)
#' fromto(foo, "^f", "^t", from_i = 2, to_i = 2, shift_from = 1, shift_to = -1)
#' fromto(foo, "^f", "^t", from_i = 2, to_i = 2, shift_from = -1, shift_to = 2)
fromto <- function(x, from, to, from_i = 1, to_i = 1,
                   shift_from = 0, shift_to = 0,
                   remove_empty_item = TRUE) {
  i <- grep(from, x)[from_i]
  j <- grep(to, x)
  j <- j[j > i][to_i]
  result <- x[(i + shift_from):(j + shift_to)]
  if (isTRUE(remove_empty_item)) result <- result[result != ""]
  return(result)
}
