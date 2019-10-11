bioclim.extract <- function(bioclim.pos="E:/analysis and graphics/R.eclipse/data/worldclim",site)
{	
	## BIO1 = Annual Mean Temperature
	## BIO2 = Mean Diurnal Range (Mean of monthly (max temp - min temp))
	## BIO3 = Isothermality (BIO2/BIO7) (* 100)
	## BIO4 = Temperature Seasonality (standard deviation *100)
	## BIO5 = Max Temperature of Warmest Month
	## BIO6 = Min Temperature of Coldest Month
	## BIO7 = Temperature Annual Range (BIO5-BIO6)
	## BIO8 = Mean Temperature of Wettest Quarter
	## BIO9 = Mean Temperature of Driest Quarter
	## BIO10 = Mean Temperature of Warmest Quarter
	## BIO11 = Mean Temperature of Coldest Quarter
	## BIO12 = Annual Precipitation
	## BIO13 = Precipitation of Wettest Month
	## BIO14 = Precipitation of Driest Month
	## BIO15 = Precipitation Seasonality (Coefficient of Variation)
	## BIO16 = Precipitation of Wettest Quarter
	## BIO17 = Precipitation of Driest Quarter
	## BIO18 = Precipitation of Warmest Quarter
	## BIO19 = Precipitation of Coldest Quarter

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
