#' @name powers_of_ten
#'
#' @title Conversions from or to powers of ten.
#' @description I often need to table big numbers in non-scientific notation.
#' @family statistics
NULL

#' @rdname powers_of_ten
#' @param x a numeric vector.
#' @param exponent Specify an exponent instead of deriving one from the data.
#' @return An attributed numeric vector.
#' @family vector functions
#' @export
#' @examples
#' # Using vectors
#' 
#' print(x <- (5 + rnorm(15)) * 10^11)
#' convert_to_power_of_ten(x, 6)
#' print(y <- convert_to_power_of_ten(x))
#' all.equal(x, convert_from_power_of_ten(y))
#' 
convert_to_power_of_ten <- function(x, exponent = NULL) {
    options(scipen = 999)
    on.exit(options(scipen = 0))
    if (is.null(exponent)) {
        res <- x
        mean_of_upper_half <- function(x) {
            mean(sort(x, decreasing = TRUE)[1:(length(x) / 2)])
        }
        stat <- mean_of_upper_half(res)
        p <- 3
        fix_factor <- 10^p
        factor <- 10^p
        i <- 1
        while (stat > fix_factor) {
            exponent <- i * p
            res <- res / fix_factor
            stat <- mean_of_upper_half(res)
            factor <- factor * fix_factor
            i <- i + 1
        }
    } else {
        res <- x / 10^exponent
    }

    attributes <- list("original" = x,
                       "exponent" = exponent,
                       "numeric_factor" = 10^exponent,
                       "tex_factor" = paste0("10^{", exponent, "}"))
    attr(res, "power_of_ten") <- attributes
    class(res) <- c(class(x), "powers_of_ten")
   return(res)
}

#' @rdname powers_of_ten
#' @param x An attributed numeric vector.
#' @return A numeric vector.
#' @family vector functions
#' @export
convert_from_power_of_ten <- function(x) {
    if (inherits(x, "powers_of_ten")) {
        res <- attr(x, "power_of_ten")[["original"]]
    } else {
        res <- x
        warning("x is not of class `powers_of_ten`.")
    }
    return(res)
}

#' @rdname powers_of_ten
#' @param x A data frame.
#' @param is_individual Use individual powers of ten for each numeric column in
#' \code{x}? But why would you want to?
#' @return A data frame with attributed numeric columns.
#' @family statistics
#' @export
#' @examples
#' # Using data frames 
#' ## same exponent for all numeric columns
#' x <- (5 + rnorm(15)) * 10^11
#' df <- data.frame(x, y = x * 10^3, z = letters[seq_along(x)],
#'                 row.names = as.character(seq_along(x)))
#' x <- df_to_powers_of_ten(df)
#' str(x)
#' y <- df_from_powers_of_ten(x) 
#' identical(df, y)
#' ## individual exponents for different columns - but what for?
#' ### automatically
#' ### manually
#' df1 <- df
#' df1[["x"]] <- convert_to_power_of_ten(df1[["x"]])
#' df1[["y"]] <- convert_to_power_of_ten(df1[["y"]])
#' str(df1)
#' print(df2 <- df_from_powers_of_ten(df1))
#' identical(df, df2)
df_to_powers_of_ten <- function(x, is_individual = FALSE) {
    res <- x
    if (isTRUE(is_individual)) {
        res <- data.frame(lapply(res,
                                 function(x) {
                                     if (is.numeric(x)) {
                                         r <- convert_to_power_of_ten(x)
                                     } else {
                                         r <- x
                                     }
                                     return(r)
                                 }))
    } else {
        numeric_columns <- names(res[TRUE, sapply(res, is.numeric)])
        pot <- convert_to_power_of_ten(unlist(res[TRUE, numeric_columns]))
        exp <- attr(pot ,"power_of_ten")[["exponent"]]
        res <- data.frame(lapply(res,
                                 function(x) {
                                     if (is.numeric(x)) {
                                         r <- convert_to_power_of_ten(x, exp)
                                     } else {
                                         r <- x
                                     }
                                     return(r)
                                 }))
    }
    dimnames(res) <- dimnames(x)
    return(res)
}

#' @rdname powers_of_ten
#' @param x A data frame with attributed numeric columns.
#' @return A  data frame.
#' @family statistics
#' @export
df_from_powers_of_ten <- function(x) {
    res <- x
    res <- data.frame(lapply(res, function(x) {
                                 if (is.numeric(x)) {
                                     r <- convert_from_power_of_ten(x)
                                 } else {
                                     r <- x
                                 }
                                 return(r)
                                }
    ))
    dimnames(res) <- dimnames(x)
    return(res)
}
