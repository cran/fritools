if (get_run_r_tests()) {
    test_only_pure_r <- function() {
        path <- tryCatch(packager::as.package("/tmp")[["path"]],
                         error = identity)
        if (inherits(path, "error"))
            path <- system.file("DESCRIPTION", package = "fritools")
        deps <- desc::desc_get_deps()
        result <- !any(deps[["type"]] == "Depends" & deps[["package"]] != "R")
        msg <- "fritools must only depend on R itself!"
        RUnit::checkTrue(result, msg = msg)

        result <- !any(deps[["type"]] == "Imports")
        msg <- paste("fritools must not import any package!",
                     "You may suggest packages and use dem conditionally as I",
                     "have done with checkmate, see fritools::is_not_false.")
        RUnit::checkTrue(result, msg = msg)
    }
}
