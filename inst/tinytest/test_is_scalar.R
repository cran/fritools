if (interactive()) {
    pkgload::load_all()
    library("tinytest")
}

x <- "C"
expect_true(is_scalar(x))
x <- LETTERS[1:24]
expect_true(!is_scalar(x))
expect_true(is_scalar(x[3]))
dim(x) <- c(6, 4)
expect_true(!is_scalar(x))
expect_true(is_scalar(x[1, 2]))
dim(x) <- c(2, 3, 4)
expect_true(!is_scalar(x))
expect_true(is_scalar(x[1, 2, 3]))
expect_true(is_scalar(list(1)))
