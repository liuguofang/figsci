confidence_line_scatter <- function(mydata, x, y, line.col = "black", confidence.line.col = "red", 
    confidence.line = FALSE, ...) 
{
    x <- mydata[, x]
    y <- mydata[, y]
    lm.model <- lm(y ~ x)
    plot(x, y, ...)
    library(plotrix)
    ablineclip(lm.model, x1 = range(x)[1], x2 = range(x)[2], col = line.col)
    if (confidence.line) {
        new <- sort(x)
        prd <- predict(lm.model, new = data.frame(x = new), interval = "confidence", 
            level = 0.95, type = "response")
        lines(new, prd[, 2], col = confidence.line.col, lty = 2)
        lines(new, prd[, 3], col = confidence.line.col, lty = 2)
    }
    P <- summary(lm.model)$coef[2, 4]
    P <- ifelse(P < 0.001, " < 0.001", paste(" = ", round(P, 3), sep = ""))
    
    corner.label(x = -1, y = 1, label = substitute(paste(R^2 == A, B), list(A = sprintf("%.4f, ", 
        summary(lm.model)$r.squared), B = paste("P", P))))
}
