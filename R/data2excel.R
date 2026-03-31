data2excel <- function(dat, filename, sheet.name, create =TRUE, ...) {
	dat <- cbind(row.name = rownames(dat), dat)
	library(XLConnect)
	wb  <-  loadWorkbook(filename,  create  =  create)
	createSheet(wb,  name  =  sheet.name)
	writeWorksheet(wb,  dat,  sheet  =  sheet.name, rownames = TRUE, ...)
	saveWorkbook(wb)
}

