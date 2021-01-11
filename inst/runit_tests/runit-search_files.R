if (interactive()) pkgload::load_all(".")
test_search_files <- function() {
    path <- tempfile()
    dir.create(path)
    data(mtcars)
    data(iris)
    write.csv(mtcars, file.path(path, "mtcars1.csv"))
    write.csv(mtcars, file.path(path, "mtcars2.csv"))
    write.csv(iris, file.path(path, "iris.csv"))
    result <- search_files(what = "Mazda", path = path)
    expectation <- file.path(path, c("mtcars1.csv", "mtcars2.csv"))
    RUnit::checkIdentical(result, expectation)
    result <- search_files(what = "[Ss]etosa", path = path)
    expectation <- file.path(path, "iris.csv")
    RUnit::checkIdentical(result, expectation)
}
if (interactive()) {
    test_search_files()
}
