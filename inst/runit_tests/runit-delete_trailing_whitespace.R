if (interactive()) pkgload::load_all(".")
test_delete_trailing_white <- function() {
    template <- system.file("files", "blanks.txt", package = "fritools")
    input <- tempfile()
    file.copy(template, input)
    delete_trailing_whitespace(input)
    result <- readLines(input)
    template <- readLines(template)
    RUnit::checkIdentical(nchar(result),
                          as.integer(nchar(template) - c(2, 0, 0, 0)))
}
if (interactive()) {
    test_delete_trailing_whitespace()
}
