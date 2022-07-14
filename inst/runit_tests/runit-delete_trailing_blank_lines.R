if (interactive()) pkgload::load_all(".")
test_delete_trailing_blank <- function() {
    template <- system.file("files", "blanks.txt", package = "fritools")
    input <- tempfile()
    file.copy(template, input)
    delete_trailing_blank_lines(input)
    result <- readLines(input)
    template <- readLines(template)
    RUnit::checkIdentical(length(result), as.integer(length(template) - 2))
}
if (interactive()) {
    test_delete_trailing_blank_lines()
}
