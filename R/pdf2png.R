pdf2png <- function(pdf.pos, pdftopng.pos, resolution=250, full.page = FALSE){
	setwd(pdf.pos)
	file.copy(sprintf("%s/%s",pdftopng.pos,"pdftopng.exe"),getwd())
	file <- dir(pattern=".pdf")
	
	cmd <- sprintf("%s \"%s\" -r %s \"%s\"","pdftopng.exe", file, resolution, gsub("pdf$","png",file)) 
	
	lapply(cmd,shell)
	
	png <- dir(pattern= '\\.png')
	tag <- grep("000001",png)
	if(!full.page) file.remove(png[-tag])
	file.remove(c("pdftopng.exe"))
	file.rename(dir(pattern='\\.png'),sub("\\.png-000001","",dir(pattern='\\.png')))
}
