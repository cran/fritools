#' Escape non-ASCII Characters
#' 
#' I often get code with german umlauts that need to be escaped.
#' @param x A character vector.
#' @return A character vector.
#' @family vector functions
#' @export
#' @examples
#' x <- c("foo", "djörman", "bar", "djörman bar")
#' escape_non_ascii(x)
#' # change file
#' f <- tempfile()
#' writeLines(x, f)
#' writeLines(escape_non_ascii(readLines(f)), f)
escape_non_ascii <- function(x) {
    res <- vapply(x, function(x) {
                      x_int <- utf8ToInt(enc2utf8(x))
                      not_ascii <- which(x_int > 127L)
                      ans <- unlist(strsplit(x, "", fixed = TRUE))
                      is_bmp <- x_int[not_ascii] <= 0xffffL
                      idx_bmp <- not_ascii[is_bmp]
                      idx_astral <- not_ascii[!is_bmp]
                      ans[idx_bmp] <- sprintf("\\u%04x", x_int[idx_bmp])
                      ans[idx_astral] <- sprintf("\\U%08x", x_int[idx_astral])
                      res <- paste0(ans, collapse = "")
                      return(res)},
                      character(1),
                      USE.NAMES = FALSE)
    return(res)
}

