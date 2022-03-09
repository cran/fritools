if (interactive()) pkgload::load_all(".")
test_round_half_away_from_zero <- function() {
    x <- 22.5
    RUnit::checkEqualsNumeric(round_half_away_from_zero(x), 23)
    RUnit::checkEqualsNumeric(base::round(x), 22)
    RUnit::checkEqualsNumeric(round_half_away_from_zero(-x), -23)
    RUnit::checkEqualsNumeric(base::round(-x), -22)

}
if (interactive()) {
    test_round_half_away_from_zero()
}
