counties.map <- function(county.polygon.dir = "E:/analysis and graphics/R.eclipse/data/GIS-地图/县级行政界线",
                      county.points.dir = "E:/analysis and graphics/R.eclipse/data",
                      counties,text.pos = 1,legend.pos= c(0.9,0.9),scale.pos = c(0.05,0.05),color=1,
                      strange.polygon=FALSE,offset=0.3,...){
setwd(county.polygon.dir)
library(maptools)
county <- readShapePoly("BOUNT_poly.shp")
tag <- lapply(1:length(counties),function(s) grep(counties[s],county@data$NAME99))

county.pos <- read.csv(sprintf("%s/%s",county.points.dir,"2089counties.csv"))
county.pos <- county.pos[pmatch(counties,county.pos$county),]
county.pos[,1] <- counties

mis.match.tag <-which(is.na(county.pos[,2]))

if(length(mis.match.tag)!=0){ 
  mis.match.tag.order <- data.frame(county=NULL,code=NULL)
  
  for(i in 1:length(mis.match.tag)){
    if(length(grep(counties[mis.match.tag[i]],county@data$NAME99))==0) 
      mis.match.tag.order <- rbind(mis.match.tag.order,data.frame(county=counties[mis.match.tag[i]],code=NA)) else
        mis.match.tag.order <-rbind(mis.match.tag.order,data.frame(county=counties[mis.match.tag[i]],
                                                                   code=grep(counties[mis.match.tag[i]],county@data$NAME99)))
  }
  
  mis.county.pos <- cbind(county=mis.match.tag.order$county,county@data[mis.match.tag.order$code,c("CENTROID_X","CENTROID_Y")])
  names(mis.county.pos)[2:3] <- c('lon','lat')
  county.pos <- unique(rbind(county.pos[-mis.match.tag,],mis.county.pos))
} 

county.pos <- split(county.pos,f = county.pos$county)
county.pos <- lapply(1:length(counties),function(s) county.pos[[counties[s]]])
if(length(text.pos)<length(counties)){
  text.pos <- c(text.pos,rep(1,length(counties)-length(text.pos)))
  color <- c(color,rep(1,length(counties)-length(color)))
}

names(text.pos) <- counties

text.pos <- lapply(1:length(counties),function(s) text.pos[counties[s]])

tag2 <- unlist(tag)
if(strange.polygon){
  set.seed(123)
  mean.dist <- apply(geosphere::distm(county@data[tag2,c("CENTROID_X",'CENTROID_Y')]),1,mean)
  strange.polygon.order <- match(mean.dist[kmeans(mean.dist,centers = 2)$cluster==2],mean.dist)
  tag2 <- tag2[-strange.polygon.order]
}
par(mar=rep(0,4),omi=c(0.8,0.8,0.1,0.1),xaxs='i',yaxs='i')
xyrange <- lapply(1:length(tag2),function(i) apply(county@polygons[[tag2[i]]]@Polygons[[1]]@coords,2,range))
xyrange <- apply(do.call(rbind,xyrange),2,range)* (c(0.999,1.001))

plot(1,xlim=xyrange[,1],ylim=xyrange[,2],xlab='',ylab='')
for(i in 1:length(tag)){
   if(length(tag[[i]])!=0) {
     if(length(tag[[i]])==1)
       polygon(county@polygons[[tag[[i]]]]@Polygons[[1]]@coords,col=color[i],...) else  
         for(j in 1:length(tag[[i]])) 
         polygon(county@polygons[[unlist(tag[[i]])[j]]]@Polygons[[1]]@coords,col=color[i],...) 
   }
}
for(i in 1:length(tag))
  if(length(tag[[i]])!=0) {
  with(county.pos[[i]],points(lon,lat,pch=1))
  with(county.pos[[i]],text(lon,lat,county,pos=text.pos[[i]],offset=offset,...))
}
 sp::compassRose(grconvertX(legend.pos[1], "npc"),grconvertY(legend.pos[2], "npc"),cex=0.8)

mtext(~Longitude~(degree),side=1,line=2.5)
mtext(~Latitude~(degree),side=2,line=2.5)
space <- par('din')[1]-par('fin')[1]
cat("A suggested figure size:",round(c((diff(xyrange[,1])*0.8+space)/(diff(xyrange[,2])+space),1)*5,1),"\n")
mark.value <- c(10, 50, 100, 500, 1000, 5000, 10000)
raster::scalebar(mark.value[which.min(abs(diff(xyrange[,1])*100/6-mark.value))], xy=c(grconvertX(scale.pos[1], "npc"),grconvertY(scale.pos[2], "npc")), type='bar', divs=4,below='km')
}
