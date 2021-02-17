if (interactive()) pkgload::load_all(".")
test_is_of_length_zero <- function() {
    x <- grep(" ", "")
    RUnit::checkTrue(is_of_length_zero(x))
    RUnit::checkTrue(!is_of_length_zero(x, "character"))
    RUnit::checkTrue(is_of_length_zero(x, "numeric"))
    RUnit::checkTrue(is_of_length_zero(x, "integer"))
}
if (interactive()) {
    test_is_of_length_zero()
}
