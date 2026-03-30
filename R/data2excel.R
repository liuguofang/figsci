data2excel <- function(dat, filename, sheetname, create =TRUE, ...) {
	dat <- cbind(row.name = rownames(dat), dat)
	library(XLConnect)
	wb  <-  loadWorkbook(filename,  create  =  create)
	createSheet(wb,  name  =  sheetname)
	writeWorksheet(wb,  dat,  sheet  =  sheetname, rownames = TRUE, ...)
	saveWorkbook(wb)
}

