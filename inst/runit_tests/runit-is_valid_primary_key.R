if (interactive()) pkgload::load_all(".")
test_is_valid_primary_key <- function() {
    data(mtcars)
    RUnit::checkTrue(!is_valid_primary_key(mtcars, "qsec"))
    RUnit::checkTrue(!is_valid_primary_key(mtcars, "carb"))
    RUnit::checkTrue(!is_valid_primary_key(mtcars, c("qsec", "gear")))
    RUnit::checkTrue(is_valid_primary_key(mtcars, c("qsec", "carb")))
    cars <- mtcars
    cars[["id"]] <-  seq_len(nrow(cars))
    RUnit::checkTrue(is_valid_primary_key(cars, "id"))

}
if (interactive()) {
    test_is_valid_primary_key()
}
