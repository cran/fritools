if (interactive()) pkgload::load_all(".")
test_fromto <- function() {
    foo <- c("f1", "A", "f2", rep("B", 4), "t1", "f3", "C", "t2",
             rep("D", 4), "t3")
    result <- fromto(foo, "^f", "^t")
    expectation <- c("f1", "A", "f2", "B", "B", "B", "B", "t1")
    RUnit::checkIdentical(result, expectation)

    result <- fromto(foo, "^f", "^t", from_i = 2)
    expectation <- c("f2", "B", "B", "B", "B", "t1")
    RUnit::checkIdentical(result, expectation)

    result <- fromto(foo, "^f", "^t", from_i = 2, to_i = 2)
    expectation <- c("f2", "B", "B", "B", "B", "t1", "f3", "C", "t2")
    RUnit::checkIdentical(result, expectation)

    result <- fromto(foo, "^f", "^t", from_i = 2, to_i = 2, shift_from = 1,
                     shift_to = -1)
    expectation <- c("B", "B", "B", "B", "t1", "f3", "C")
    RUnit::checkIdentical(result, expectation)

    result <- fromto(foo, "^f", "^t", from_i = 2, to_i = 2, shift_from = -1,
                     shift_to = 2)
    expectation <- c("A", "f2", "B", "B", "B", "B", "t1", "f3",
                     "C", "t2", "D", "D")
    RUnit::checkIdentical(result, expectation)
}

if (interactive()) {
    test_fromto()
}
