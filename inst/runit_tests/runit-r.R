if (interactive()) pkgload::load_all(".")
if (get_boolean_envvar("IS_RUNIT") && get_run_r_tests()) {
    test_r <- function() {
        wd <- setwd(tempdir())
        on.exit(setwd(wd))
        path <- tempfile()
        tempdir <- tempfile()
        dir.create(tempdir)
        packager::create(path, fakemake = FALSE)
        on.exit(unlink(path, recursive = TRUE), add = TRUE)

        description_path <- file.path(path, "DESCRIPTION")
        lines <- readLines(description_path)
        expectation <- fritools:::get_desc_value("Package", lines = lines)
        result <- basename(path)
        RUnit::checkIdentical(expectation, result)
        RUnit::checkException(fritools:::get_current_tarball(tempdir))
        tarball <- fritools:::r_cmd_build(path = path,
                                          output_directory = tempdir)
        package_tarball <- list.files(tempdir, pattern = "file.*\\.tar\\.gz",
                                      full.names = TRUE)
        RUnit::checkTrue(file.exists(tarball))
        RUnit::checkIdentical(tarball, package_tarball)
        touch(file.path(tempdir, "foo.tar.gz"))
        expectation <- file.path(tempdir, "bar.tar.gz")
        touch(expectation); touch(expectation)
        # touch twice to ensure that expectation is than bar.tar.gz
        RUnit::checkIdentical(fritools:::get_current_tarball(tempdir),
                              expectation)
        package_tarball <- list.files(tempdir, pattern = "file.*\\.tar\\.gz",
                                      full.names = TRUE)
        fake_tarball <- sub("_.*\\.tar.gz", "_99.0.0.tar.gz", package_tarball)
        file.copy(package_tarball, fake_tarball)
        result <- fritools:::get_current_tarball(tempdir)
        RUnit::checkIdentical(result, fake_tarball)
        result <- fritools:::get_current_tarball(tempdir,
                                                 package_dir = tempdir)
        RUnit::checkIdentical(result, fake_tarball)
        result <- fritools:::get_current_tarball(tempdir, package_dir = path)
        RUnit::checkIdentical(result, package_tarball)
        RUnit::checkIdentical(fritools:::r_cmd_check(path = package_tarball),
                              0L)
        RUnit::checkIdentical(r_cmd_install(path = package_tarball), 0L)
        RUnit::checkIdentical(r_cmd_install(path = path), 0L)
        RUnit::checkIdentical(r_cmd_install(path = path, try_tarball = FALSE),
                              0L)
    }
    if (interactive()) {
        test_r()
    }
}
