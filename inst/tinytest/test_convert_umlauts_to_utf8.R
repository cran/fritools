if (interactive()) {
  pkgload::load_all()
  library("tinytest")
}
if (fritools::is_version_sufficient(
  fritools::get_package_version("base"),
  "4.5.0"
)) {
string <- "\xdc"

  expectation <- "\u00dc"
  result <- convert_umlauts_to_utf8(string)
  expect_identical(result, expectation)
  df <- data.frame(
    v1 = c(string, "foobar"),
    v2 = c("foobar", string), v3 = 3:4
  )
  names(df)[3] <- "y\xdcy"
  result <- convert_umlauts_to_utf8(df)
  expectation <-
    structure(list(
      v1 = c(
        expectation,
        "foobar"
      ),
      v2 = c(
        "foobar", 
        expectation
      ),
      "y\u00dcy" = c(3L, 4L)
    ),
    class = "data.frame", row.names = c(NA, -2L)
    )
  expect_identical(result, expectation)
}
