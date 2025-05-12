#' Substitute All Blanks and Punctuations in a String with an Underscore
#' 
#' Need to store stuff on disk. 
#' Replacement may also be a minus sign instead of underscore.
#' @param x A string.
#' @param replacement The replacement character.
#' @return A string.
#' @export
#' @family file utilities
#' @family vector functions
#' @examples
#' file_string("foo:bar$ this, indeed(!) is # a number 7")
#' file_string("foo:bar$ this, indeed(!) is # a number 7", replacement = "-")
file_string <- function(x, replacement = c("_", "-")) {
    repl <- match.arg(replacement)
    res <- gsub("[[:punct:]]", repl, x)
    res <- gsub("[[:blank:]]", repl, res)
    res <- gsub(paste0(repl, "+"), repl, res)
    return(res)
}
