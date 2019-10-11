GPS.pt2photo <- function(photo.pos ="d:/photo", exiftool.pos= "D:/software/EXE", GPS.point)
{
    setwd(photo.pos)
    file.copy(sprintf("%s/%s", exiftool.pos, "exiftool.exe"), 
        getwd())
    file <- dir(pattern = ".jpg|.JPG")
    cmd <- sprintf("exiftool -GPSLatitude=%f -GPSLongitude=%f \"%s\"",GPS.point[2],GPS.point[1],file)

    lapply(cmd, shell)
}
