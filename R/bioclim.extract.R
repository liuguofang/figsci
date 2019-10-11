bioclim.extract <- function(bioclim.pos="E:/analysis and graphics/R.eclipse/data/worldclim",site)
{
	# resolution: 30 second
	library(raster)
	
	for(i in 1:19)
		assign(sprintf("bio%d",i),raster(sprintf("%s/bioclim%d.gri",bioclim.pos,i)))
	
	result <- data.frame(matrix(NA,ncol=19,nrow=nrow(site)))
	names(result) <- paste("bio",1:19,sep='')
	
	for(i in 1:19){
		result[,i] <- extract(get(sprintf("bio%d",i)),site)
		if(i <= 11) result[,i]/10->result[,i]
	}
	cbind(site,result)
}
