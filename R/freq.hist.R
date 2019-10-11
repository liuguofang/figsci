freq.hist <- function(dat = NULL, ...) {
    if (missing(dat)) {
        set.seed(1)
        dat <- rnorm(1000, 50, 10)
    }
    H <- hist(dat, freq = TRUE, ...)  ## This will plot the histogram as well
    dx <- min(diff(H$breaks))
    curve(length(dat) * dx * dnorm(x, mean(dat), sd(dat)), add = TRUE, 
        col = "blue")
} 
