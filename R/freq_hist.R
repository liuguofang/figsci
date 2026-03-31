freq_hist <- function(dat = NULL, bins = 30) {
    library(ggplot2)
    if (is.null(dat)) {
        set.seed(123)
        dat <- rnorm(1000, 50, 10)
    }
    n <- length(dat)
    m <- mean(dat, na.rm = TRUE)
    s <- sd(dat, na.rm = TRUE)
    cv <- s / m
    df <- data.frame(x = dat)
    hist_data <- hist(dat, breaks = bins, plot = FALSE)
    max_y <- max(hist_data$counts)
    x_pos <- max(dat) - 0.15 * diff(range(dat))
    y_pos <- max_y - 0.05 * max_y
    p <- ggplot(df, aes(x = x)) +
        geom_histogram(aes(y = ..count..), bins = bins, fill = "grey80", color = "black") +
        stat_function(fun = function(x) n * diff(range(dat))/bins * dnorm(x, m, s), 
                      color = "blue", size = 1) +
        ggthemes::theme_few() +
        annotate("text", 
                 x = x_pos, y = y_pos, 
                 label = sprintf("n = %d\nmean = %.2f\nsd = %.2f\nCV = %.2f", n, m, s, cv),
                 hjust = 0, vjust = 1, size = 4)
    print(p)
}

