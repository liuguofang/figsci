province.area <- function(province){

	library(maptools)
	library(gstat)
	nation.edge <- 'bou2_4p.shp'
	nc <- readShapePoly(nation.edge, proj4string = CRS("+proj=longlat +ellps=clrk66"))
	tag <- grep(province,nc@data$NAME)
	res <- NULL
	for(i in 1:length(tag))		
		res <- rbind(res,nc@polygons[[tag[i]]]@Polygons[[1]]@coords)

	library(splancs)
	areapl(res)
}
