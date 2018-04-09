#' A colorexcel function
#'
#' This function can be used to color outliers of excel data.
#' @filename the file name of a excel data.
#' @threhold the threhold value which is checked.
#' @variable the continous variable name of data.
#' @more  a switch which TRUE and FALSE denote over and less than the threhold.
#' @sheetTh the order of sheet in the excel file.
#' @color makered colour.
#' @examples 


colorexcel <- function(filename, threhold, variable, more = TRUE, sheetTh = 1, color=2)
{
	require(XLConnect)
	wb <- loadWorkbook(filename, create = TRUE)
	dat = readWorksheet(wb, sheet = getSheets(wb)[sheetTh])
	heavyCar <- createCellStyle(wb, name = paste(sample(c(LETTERS, 
									letters, 0:9), 3), collapse = ""))
	setFillPattern(heavyCar, fill = XLC$FILL.SOLID_FOREGROUND)
	setFillForegroundColor(heavyCar, color = color)
	if (more) {
		rowIndex = which(dat[[variable]] > threhold)
	} else rowIndex = which(dat[[variable]] < threhold)
	
	rowIndex <- rowIndex + 1
	colIndex <- which(names(dat) == variable)
	setCellStyle(wb, sheet = getSheets(wb)[sheetTh], row = rowIndex, 
			col = colIndex, cellstyle = heavyCar)
	saveWorkbook(wb)
} 

