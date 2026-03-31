#' A colorexcel function
#'
#' This function can be used to color outliers of excel data.
#' @filename the file name of a excel data.
#' @threshold the threshold value which is checked.
#' @variable the continous variable name of data.
#' @more  a switch which TRUE and FALSE denote over and less than the threshold.
#' @sheetTh the order of sheet in the excel file.
#' @color makered colour.
#' @examples 


highlight_excel_cells <- function(filename, threshold, variable, more = TRUE, sheet.name = NULL, color = 2) {
  require(XLConnect)
  wb <- loadWorkbook(filename, create = TRUE)
  if (is.null(sheet.name)) {
    stop("Please provide the sheet name using the 'sheet.name' argument.")
  }
  dat <- readWorksheet(wb, sheet = sheet.name)
  heavyCar <- createCellStyle(wb, name = paste(sample(c(LETTERS, letters, 0:9), 3), collapse = ""))
  setFillPattern(heavyCar, fill = XLC$FILL.SOLID_FOREGROUND)
  setFillForegroundColor(heavyCar, color = color)
  if (more) {
    rowIndex <- which(dat[[variable]] > threshold)
  } else {
    rowIndex <- which(dat[[variable]] < threshold)
  }
  rowIndex <- rowIndex + 1
  colIndex <- which(names(dat) == variable)
  setCellStyle(wb, sheet = sheet.name, row = rowIndex, col = colIndex, cellstyle = heavyCar)
  saveWorkbook(wb)
}
