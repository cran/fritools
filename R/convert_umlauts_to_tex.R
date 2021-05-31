#' Tex Codes for German Umlauts
#'
#' @param x A string.
#' @return A string with the umlauts converted to plain TeX.
#' @export
convert_umlauts_to_tex <- function(x) {
    s <- iconv(x, from = "UTF-8", to = "UTF-8", sub = "Unicode")
    s <- gsub("\u00e4", '\\\\"a{}', s)
    s <- gsub("\u00c4", '\\\\"A{}', s)
    s <- gsub("\u00f6", '\\\\"o{}', s)
    s <- gsub("\u00d6", '\\\\"O{}', s)
    s <- gsub("\u00fc", '\\\\"u{}', s)
    s <- gsub("\u00dc", '\\\\"U{}', s)
    s <- gsub("\u00df", '\\\\ss{}', s)
    return(s)
}
