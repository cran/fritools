if (interactive()) {
    pkgload::load_all()
    library("tinytest")
}
set.seed(1234); x <- (5 + rnorm(15)) * 10^11
expectation <- 
structure(c(379.293425061458, 527.742924211066, 608.444117668306, 
265.430229737065, 542.912468881105, 550.605589215757, 442.526003986535, 
445.336814421581, 443.554800090672, 410.99621709559, 452.280730024645, 
400.16135551403, 422.374610536201, 506.445881727627, 595.949405897077
), power_of_ten = list(original = c(379293425061.458, 527742924211.066, 
608444117668.306, 265430229737.065, 542912468881.105, 550605589215.757, 
442526003986.535, 445336814421.581, 443554800090.672, 410996217095.59, 
452280730024.645, 400161355514.03, 422374610536.201, 506445881727.627, 
595949405897.077), exponent = 9, numeric_factor = 1e+09, tex_factor = "10^{9}"), class = c("numeric", 
"powers_of_ten"))
result <- convert_to_power_of_ten(x)
expect_equal(result, expectation)
expectation <- result
result <- convert_to_power_of_ten(x, 9)
expect_equal(result, expectation)
expectation <- x
result <- convert_from_power_of_ten(result)
expect_equal(result, expectation)
