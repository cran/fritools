if (interactive()) pkgload::load_all(".")
test_file_modified_last <- function() {
    dir.create(file.path(tempdir(), "new"))
    touch(file.path(tempdir(), "file1.txt"))
    Sys.sleep(2)
    touch(file.path(tempdir(), "file2.txt"))
    Sys.sleep(2)
    touch(file.path(tempdir(), "new", "file3.txt"))
    expectation <- "file2.txt"
    found <- file_modified_last(path = tempdir(), pattern = "file.\\.txt$")
    result <- basename(found)
    RUnit::checkIdentical(expectation, result)
    expectation <- "file3.txt"
    found <- file_modified_last(path = tempdir(), pattern = "file.\\.txt$",
                                recursive = TRUE)
    result <- basename(found)
    RUnit::checkIdentical(expectation, result)
}

if (interactive()) {
    test_file_modified_last()
}
