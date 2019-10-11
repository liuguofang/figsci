north.direction <- function(x.change = 0, y.change = 0) {
    # x.change and y.change belong to [0,1]
    x0 <- grconvertX(c(0.9, 0.85, 0.9, 0.95, 0.9) - x.change, "npc")
    y0 <- grconvertY(c(0.95, 0.8, 0.85, 0.8, 0.95) - y.change, "npc")
    pt <- data.frame(x0, y0)
    polygon(pt[c(1, 2, 3, 1), ], col = "black")
    polygon(pt[c(1, 3, 4, 1), ], col = NA)
    text(x0[1], y0[1], "N", xpd = TRUE, adj = c(0.5, 0))
} 
