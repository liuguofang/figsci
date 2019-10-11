
save.fig <- function (fn, width = 6, height = 5, pointsize = 12, res=300)
{
	dev.copy(device = tiff, file = paste(fn, ".tiff",sep = ""), 
		 width = width, height = height,
		 pointsize = pointsize,units = "in", res = res,
		 compression = 'lzw')
	dev.off()
	dev.copy(device = postscript, file = paste(fn, ".eps", sep = ""),
		 width = width, height = height,
		 pointsize = pointsize)
	dev.off()
	dev.copy(device = pdf, file = paste(fn, ".pdf", sep = ""),
		 width = width, height = height,
		 pointsize = pointsize)
	dev.off()
}
