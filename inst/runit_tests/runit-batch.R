if (fritools::get_run_r_tests()) {
    if (interactive()) pkgload::load_all(".")
    test_is_batch <- function() {
        result <- system("R --vanilla --silent -e 'fritools::is_batch()'",
                         intern = TRUE)[2]
        expectation <- "[1] TRUE"
        RUnit::checkIdentical(result, expectation)
    }

    if (interactive()) {
        test_is_batch()
    }

    test_get_r_cmd_batch_path <- function() {
        old <- setwd(tempdir())
        on.exit(setwd(old))
        tempfile <- tempfile()
        writeLines("fritools::get_r_cmd_batch_script_path()", tempfile)
        system(paste("R CMD BATCH ", tempfile))
        result <- readLines(paste0(tempfile, ".Rout"))
        result <- grep("\\[1\\]", result, value = TRUE)
        result <- sub("[1] ", "", gsub("\\\"", "", result), fixed = TRUE)
        RUnit::checkIdentical(result, tempfile)
    }

    if (interactive()) {
        test_get_r_cmd_batch_path()
    }

    test_get_rscript_script_path <- function() {
        old <- setwd(tempdir())
        on.exit(setwd(old))
        tempfile <- tempfile()
        writeLines("fritools::get_rscript_script_path()", tempfile)
        result <- system(paste("Rscript", tempfile), intern = TRUE)
        result <- sub("[1] ", "", gsub("\\\"", "", result), fixed = TRUE)
        RUnit::checkIdentical(result, tempfile)
    }

    if (interactive()) {
        test_get_rscript_script_path()
    }

    test_get_script_path <- function() {
        old <- setwd(tempdir())
        on.exit(setwd(old))
        tempfile <- tempfile()
        writeLines("fritools::get_script_path()", tempfile)
        # R
        system(paste("R CMD BATCH ", tempfile))
        result <- readLines(paste0(tempfile, ".Rout"))
        result <- grep("\\[1\\]", result, value = TRUE)
        result <- sub("[1] ", "", gsub("\\\"", "", result), fixed = TRUE)
        RUnit::checkIdentical(result, tempfile)
        # Rscript
        result <- system(paste("Rscript", tempfile), intern = TRUE)
        result <- sub("[1] ", "", gsub("\\\"", "", result), fixed = TRUE)
        RUnit::checkIdentical(result, tempfile)
    }

    if (interactive()) {
        test_get_script_path()
    }

    test_get_script_name <- function() {
        old <- setwd(tempdir())
        on.exit(setwd(old))
        tempfile <- tempfile()
        writeLines("fritools::get_script_name()", tempfile)
        system(paste("R CMD BATCH ", tempfile))
        result <- readLines(paste0(tempfile, ".Rout"))
        result <- grep("\\[1\\]", result, value = TRUE)
        result <- sub("[1] ", "", gsub("\\\"", "", result), fixed = TRUE)
        RUnit::checkIdentical(result, basename(tempfile))
        system(paste("R CMD BATCH --interactive", tempfile))
    }
}
