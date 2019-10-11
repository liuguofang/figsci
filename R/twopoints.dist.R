twopoints.dist <- function(lat1, lon1, lat2, lon2) {
    # km, earth radius
    R <- 6371 
    radians <- function(x) x/180 * pi
    2 * R * asin(min(1, sqrt(sin((radians(lat2) - radians(lat1))/2)^2 + 
        sin((radians(lon2 - lon1))/2)^2 * cos(radians(lat1)) * 
            cos(radians(lat2)))))
}
