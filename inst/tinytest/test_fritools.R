if (interactive()) {
    pkgload::load_all()
    library("tinytest")
}
unlink(dir(tempdir(), full.names = TRUE))
f <- file.path(tempdir(), paste0("a", ".csv"))
cars <- mtcars[1:2, TRUE]
a <- write_csv(cars, file = f)
expect_true(file.exists(f))
expect_identical(get_path(a), f)
