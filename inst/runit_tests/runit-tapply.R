if (interactive()) pkgload::load_all(".")
test_official_example <- function() {
    result <- fritools::tapply(warpbreaks[["breaks"]], warpbreaks[, -1], sum)
    expectation <- base::tapply(warpbreaks[["breaks"]], warpbreaks[, -1], sum)
    RUnit::checkIdentical(result, expectation)
}

if (interactive()) {
    test_official_example()
}

test_tapply <- function() {
    weighted_mean <- function(df, x, w) {
        stats::weighted.mean(df[[x]], df[[w]])
    }
    data("mtcars")
    wm <- fritools::tapply(object = mtcars, index = list(mtcars[["cyl"]],
                                                    mtcars[["vs"]]),
                           func = weighted_mean, x = "mpg", w = "wt")
    for (cyl in c(4, 6, 8)) {
        for (vs in c(0, 1)) {
            subset <- mtcars[mtcars[["cyl"]] == cyl & mtcars[["vs"]] == vs,
                             c("mpg", "wt")]
            if (interactive()) print(stats::weighted.mean(subset[["mpg"]],
                                                          subset[["wt"]]))
            RUnit::checkIdentical(stats::weighted.mean(subset[["mpg"]],
                                                       subset[["wt"]]),
                                  wm[as.character(cyl), as.character(vs)])
        }
    }

}

if (interactive()) {
    test_tapply()
}
