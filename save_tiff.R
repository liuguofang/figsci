
save_tiff <- function (fn, width = 6, height = 5, pointsize = 14, res=300)
{
	dev.copy(device = tiff, file = paste(fn, ".tiff",
					sep = ""), width = width, height = height,
			pointsize = pointsize,units = "in",res=res,compression = 'lzw')
	dev.off()
}
