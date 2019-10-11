province.map <- function(province='北京',...){
	library(maptools)
	library(gstat)
	nation.edge <- 'bou2_4p.shp'
	nc <- readShapePoly(nation.edge, proj4string = CRS("+proj=longlat +ellps=clrk66"))
	
	tag <- grep(province,nc@data$NAME)
	res <- NULL
	for(i in 1:length(tag))
		res  <- rbind(res,nc@polygons[[tag[i]]]@Polygons[[1]]@coords)
	
	side <- res
	xy.range=apply(side,2,range)
	require(diagram)
	openplotmat(xlim =xy.range[,1], ylim = xy.range[,2])
	axis(1)
	axis(2)
	for(i in 1:length(tag))
		
		lines(nc@polygons[[tag[i]]]@Polygons[[1]]@coords,...)
	box()
}
