province.color <- function(mapdata, provname, provcol, othercol) {
# code is written by 邱怡轩
	f <- function(x, y) ifelse(x %in% y, which(y == x), 0)
	colIndex <- sapply(mapdata$NAME, f, provname)
	fg <- c(othercol,provcol)[colIndex + 1]
	fg
} 
