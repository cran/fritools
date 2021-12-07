if (interactive()) {
    if (exists("has_digest")) rm("has_digest")
    pkgload::load_all(".")
}

has_digest <- fritools:::has_digest

adjust_expectation <- function(x) {
    # We need to adjust path to the current tempdir() and hence the hash value.
    res <- x
    # set manually
    attr(res, "path") <- file.path(tempdir(), basename(attr(res, "path")))
    # now update
    res <- set_path(res,
                    get_path(res),
                    overwrite = TRUE)
    if (has_digest()) res <- set_hash(res)
    return(res)
}

test_csv2csv <- function() {
    unlink(dir(tempdir(), full.names = TRUE))
    cars <- mtcars[1:2, TRUE]
    f <- file.path(tempdir(), paste0("cars_german", ".csv"))
    utils::write.csv2(cars, file = f)
    l <- readLines(f, n = 1)
    n_semicolae <- length(unlist(strsplit(l, split = ";")))
    n_commatae <- length(unlist(strsplit(l, split = ",")))
    RUnit::checkTrue(n_semicolae >= n_commatae)
    res <- csv2csv(f, row.names = 1)
    RUnit::checkTrue(all.equal(strip_off_attributes(res),
                               strip_off_attributes(cars)))
    l <- readLines(f, n = 1)
    n_semicolae <- length(unlist(strsplit(l, split = ";")))
    n_commatae <- length(unlist(strsplit(l, split = ",")))
    RUnit::checkTrue(n_semicolae < n_commatae)
}

if (interactive()) {
    test_csv2csv()
}

test_csv <- function() {
    #% provide data
    unlink(dir(tempdir(), full.names = TRUE))
    f <- file.path(tempdir(), paste0("a", ".csv"))
    cars <- mtcars[1:2, TRUE]
    a <- write_csv(cars, file = f)
    RUnit::checkTrue(file.exists(f))
    if (fritools::is_running_on_fvafrcu_machines())
        RUnit::checkIdentical(strip_off_attributes(get_path(a)), f)

    mtime <- file.info(f)[["mtime"]]; Sys.sleep(1)

    #% read file, setup expectation
    a <- read_csv(f)
    expectation <-
        structure(list(mpg = c(21L, 21L), cyl = c(6L, 6L),
                       disp = c(160L, 160L), hp = c(110L, 110L),
                       drat = c(3.9, 3.9), wt = c(2.62, 2.875),
                       qsec = c(16.46, 17.02), vs = c(0L, 0L), am = c(1L, 1L),
                       gear = c(4L, 4L), carb = c(4L, 4L)),
                  class = "data.frame",
                  row.names = c("Mazda RX4", "Mazda RX4 Wag"),
                  csv = "standard",
                  path = structure("/tmp/RtmpGyKumR/a.csv",
                                   mtime = structure(1638788464.61958,
                                                     class = c("POSIXct",
                                                               "POSIXt"))),
                  hash = "062a5b662192887791002c72fd196426")
    if (!has_digest())
        expectation <- un_hash(expectation)[["object"]]

    #% write
    result <- write_csv(a)
    ##% check return
    RUnit::checkIdentical(adjust_expectation(expectation),
                          adjust_expectation(result))

    ##% no writing with digest
    if (has_digest()) {
        RUnit::checkIdentical(mtime, file.info(f)[["mtime"]])
    } else {
        RUnit::checkTrue(mtime < file.info(f)[["mtime"]])
    }

    ##% modify data and write to disk
    a[1, 2] <- 300
    write_csv(a)

    ##% on a: hash not updated, still writing:
    RUnit::checkTrue(mtime < file.info(f)[["mtime"]])
    ##% on result: hash already updated, not writing with digest:
    mtime <- file.info(f)[["mtime"]]; Sys.sleep(1)
    write_csv(result)
    if (has_digest()) {
        RUnit::checkIdentical(mtime, file.info(f)[["mtime"]])
    } else {
        RUnit::checkTrue(mtime < file.info(f)[["mtime"]])
    }
    if (has_digest()) {
        ##% We update the hash value:
        a <- set_hash(a)
        write_csv(a)
        RUnit::checkIdentical(mtime, file.info(f)[["mtime"]])
    }
}

if (interactive()) {
    test_csv()
}

test_bulk <- function() {
    #% provide data
    unlink(dir(tempdir(), full.names = TRUE))
    data(mtcars)
    mt_german <- mtcars
    rownames(mt_german)[1] <- "Mazda R\u00f64"
    names(mt_german)[1] <- "mg\u00dc"
    for (i in 1:10) {
        f <- file.path(tempdir(), paste0("f", i, ".csv"))
        write.csv(mtcars[1:5, TRUE], file = f)
        f <- file.path(tempdir(), paste0("f", i, "_german.csv"))
        write.csv2(mt_german[1:7, TRUE], file = f, fileEncoding = "Latin1")
    }
    #% pass a path
    f <- list.files(tempdir(), pattern = ".*\\.csv$", full.names = TRUE)[1]
    bulk <- bulk_read_csv(f)
    RUnit::checkIdentical(length(bulk), 1L)

    #% pass multiple path
    f <- list.files(tempdir(), pattern = ".*\\.csv$", full.names = TRUE)[2:4]
    bulk <- bulk_read_csv(f)
    RUnit::checkIdentical(length(bulk), 3L)

    #% read
    bulk <- bulk_read_csv(tempdir())
    path <- structure("/tmp/RtmpGyKumR/f1.csv",
                      mtime = structure(1638789293.91084,
                                        class = c("POSIXct", "POSIXt")))
    expectation <- structure(list(mpg = c(21, 21, 22.8, 21.4, 18.7),
                                  cyl = c(6L, 6L, 4L, 6L, 8L),
                                  disp = c(160L, 160L, 108L, 258L, 360L),
                                  hp = c(110L, 110L, 93L, 110L, 175L),
                                  drat = c(3.9, 3.9, 3.85, 3.08, 3.15),
                                  wt = c(2.62, 2.875, 2.32, 3.215, 3.44),
                                  qsec = c(16.46, 17.02, 18.61, 19.44, 17.02),
                                  vs = c(0L, 0L, 1L, 1L, 0L),
                                  am = c(1L, 1L, 1L, 0L, 0L),
                                  gear = c(4L, 4L, 4L, 3L, 3L),
                                  carb = c(4L, 4L, 1L, 1L, 2L)),
                             class = "data.frame",
                             row.names = c("Mazda RX4", "Mazda RX4 Wag",
                                           "Datsun 710", "Hornet 4 Drive"
                                           , "Hornet Sportabout"),
                             csv = "standard",
                             path = path,
                             hash = "9f8cabc0eaa06329b42d697642497a29")
    if (!has_digest())
        expectation <- un_hash(expectation)[["object"]]
    RUnit::checkIdentical(bulk[["f1"]], adjust_expectation(expectation))

    #% write
    result <- bulk_write_csv(bulk)
    expectation <- bulk
    RUnit::checkIdentical(result, expectation)
    dmtime <- file.info(list.files(tempdir(), full.names = TRUE))["mtime"]
    mtime <- lapply(bulk, get_mtime)
    mtime <- as.data.frame(do.call(c, mtime))
    RUnit::checkTrue(all(mtime == dmtime))

    Sys.sleep(1)

    bulk[["f2"]][3, 5] <- bulk[["f2"]][3, 5] + 2
    result <- bulk_write_csv(bulk)
    new_times <- file.info(dir(tempdir(), full.names = TRUE))["mtime"]
    index_change <-  which(rownames(mtime) == "f2")
    if (has_digest()) {
        only_f2_changed <- all((dmtime == new_times)[-c(index_change)]) &&
            (dmtime < new_times)[c(index_change)]
        RUnit::checkTrue(only_f2_changed)
    } else {
        RUnit::checkTrue(all(mtime < new_times))
    }
}


if (interactive()) {
    test_bulk()
}
