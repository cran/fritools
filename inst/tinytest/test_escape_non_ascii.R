if (interactive()) {
    pkgload::load_all()
    library("tinytest")
}

x <- c("foo", "djörman", "bar", "djörman bar")
result <- escape_non_ascii(x)
expectation <- c("foo", "dj\\u00f6rman", "bar", "dj\\u00f6rman bar")
expect_identical(result, expectation)
