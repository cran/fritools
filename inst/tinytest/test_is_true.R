if (interactive()) {
    pkgload::load_all()
    library("tinytest")
}
expect_error(is_true(3))
expect_error(is_true(NULL))
expect_identical(is_true(1:4 < 3), c(TRUE, TRUE, FALSE, FALSE))
expect_identical(is_true(c(10, NA, 12, NaN) == 12), c(FALSE, FALSE, TRUE, FALSE))
