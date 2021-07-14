if (interactive()) pkgload::load_all(".")
if (get_run_r_tests() && ! is_running_on_gitlab_com()) {
    test_only_pure_r <- function() {
        path <- system.file("DESCRIPTION", package = "fritools")
        deps <- desc::desc_get_deps()
        result <- !any(deps[["type"]] == "Depends" & deps[["package"]] != "R")
        msg <- "fritools must only depend on R itself!"
        RUnit::checkTrue(result, msg = msg)
        core <- row.names(installed.packages(priority = "base"))
        result <- !any(deps[["type"]] == "Imports" %in% core)
        msg <- paste("fritools must not import any package!",
                     "You may suggest packages and use dem conditionally as I",
                     "have done with checkmate, see fritools::is_not_false.")
        RUnit::checkTrue(result, msg = msg)
    }
    if (interactive()) {
        test_only_pure_r()
    }
}
