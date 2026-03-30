province_area <- function(province){

	library(sf)
    nc <- st_read(shpfile, quiet = TRUE)
	tag <- grep(province, nc$NAME)
    if (length(tag) == 0) stop("Province not found.")
	  
	province_poly <- st_union(nc[tag, ])
    province_poly_proj <- st_transform(province_poly, 3857)
	 
	area_m2 <- st_area(province_poly_proj)
    area_km2 <- as.numeric(area_m2) / 1e6
  
    return(area_km2)
}
