#' Convert German Umlauts to a More or Less Suitable `utf8` Representation
#'
#' @param x A string or \code{data.frame}.
#' @return \bold{x} with the umlauts converted to utf8.
#' @family German umlaut converters
#' @export
convert_umlauts_to_utf8 <- function(x) {
    UseMethod("convert_umlauts_to_utf8", x)
}

#' @rdname convert_umlauts_to_utf8
#' @export
#' @examples
#' string <- "_(\xdcLH)"
#' print(string)
#' print(convert_umlauts_to_utf8(string))
convert_umlauts_to_utf8.character <- function(x) {
    res <- iconv(x, from = "ISO-8859-1", to = "UTF-8", sub = "Unicode")
    res <- iconv(enc2native(res), to = "UTF-8", sub = "Unicode")
    return(res)
}

#' @rdname convert_umlauts_to_utf8
#' @export
#' @examples
#' string <- "this is _(\xdcLH) string"
#' df <- data.frame(v1 = c(string, "foobar"),
#'                  v2 = c("foobar", string), v3 = 3:4)
#' names(df)[3] <- "y_(\xdcLH)"
#' convert_umlauts_to_utf8(df)
#' convert_umlauts_to_ascii(convert_umlauts_to_utf8(df))
convert_umlauts_to_utf8.data.frame <- function(x) { # Exclude Linting
    f <- function(x) {
        res <- x
        if (is.character(res))
            res <- convert_umlauts_to_utf8(res)
        return(res)
    }
    res <- x
    names <- convert_umlauts_to_utf8(colnames(res))
    names(res) <- names
    res <- data.frame(lapply(res, f))
    names <- names(res)
    attributes(res) <- attributes(x)
    names(res) <- names
    return(res)
}
