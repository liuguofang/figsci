blank.fill.transform <- function(dat, add.blank = FALSE)
{
   if(!add.blank) {
	library(mefa)
	if (any(dat == "", na.rm = TRUE)) 
		dat[dat == ""] <- NA
	fill.na(dat)
	} else {
	for (cols in 1:ncol(dat)) 
		for (rows in nrow(dat):2) 
         		if (dat[rows, cols] == dat[rows - 1, cols]) 
				dat[rows, cols] <- ""
	dat
		}
}
