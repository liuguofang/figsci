data2excel <- function(dat, filename, sheetname, create =TRUE) {
	library(XLConnect)
	wb  <-  loadWorkbook(filename,  create  =  create)
	createSheet(wb,  name  =  sheetname)
	writeWorksheet(wb,  dat,  sheet  =  sheetname)
	saveWorkbook(wb)
}

