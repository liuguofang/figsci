province.map <- function(province='北京',...){
	library(sf)
	nation.edge <- 'bou2_4p.shp'
	nc <- st_read(nation.edge, options = "ENCODING=GBK", quiet = TRUE)
	st_crs(nc) <- "+proj=longlat +ellps=clrk66"
	
	tag <- grep(province,nc$NAME)
	if(length(tag) == 0) stop("未找到该省份名称！") 
	province_poly <- nc[tag, ]
	
	plot(st_geometry(province_poly), main = province)
	axis(1)
	axis(2)
	box()
}
