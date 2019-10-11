col2hex <- function(color = "red", ...) 
{ 
    vector <- as.vector(col2rgb(color))/255
    rgb(vector[1], vector[2], vector[3], ...)
}
