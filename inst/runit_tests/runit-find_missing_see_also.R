if (interactive()) pkgload::load_all(".")
test_find_missing_x <- function() {
    path <- system.file("source", package = "fritools")
    result <- basename(find_missing_see_also(path, list_families = FALSE))
    expectation <- "fritools-package.Rd"
    RUnit::checkIdentical(result, expectation)

    result <- capture.output(find_missing_see_also(path, list_families = TRUE),
                            type = "message")

    RUnit::checkTrue("Families so far: " %in% result &&
                     any(grepl("^Other", result)))
    result <-  is_of_length_zero(find_missing_family(path,
                                                     list_families = FALSE),
                                 class = "character")
    RUnit::checkTrue(result)

    result <- capture.output(find_missing_family(path, list_families = TRUE),
                            type = "message")
    RUnit::checkTrue("Families so far: " %in% result &&
                     any(grepl("^#' @family", result)))


}
if (interactive()) {
    test_find_missing_x()
}
