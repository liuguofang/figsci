counties.map <- function(counties,text.pos = 1,legend.pos= c(0.9,0.9),strange.polygon=FALSE,...)
{
  library(maptools)
  county <- readShapePoly("BOUNT_poly.shp")
  tag <- lapply(1:length(counties),function(s) grep(counties[s],county@data$NAME99))
  
  county.pos <- read.csv("E:/analysis and graphics/R.eclipse/data/2089counties.csv")
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
  
  county.pos$county <- as.character(county.pos$county)
  text.pos <- data.frame(county=counties,text.pos)
  county.pos <- plyr::join(county.pos,text.pos)
  
  tag <- unlist(tag)
  if(strange.polygon){
    mean.dist <- apply(geosphere::distm(county@data[tag,c("CENTROID_X",'CENTROID_Y')]),1,mean)
    tag <- tag[-match(mean.dist[kmeans(mean.dist,centers = 2)$cluster==2],mean.dist)]
  }
  
  for(i in 2:3) as.numeric(county.pos[,i])->county.pos[,i]
  xyrange <- lapply(ifelse(sum(is.na(county.pos[1,]))!=2,1,2):length(tag),function(i) apply(county@polygons[[tag[i]]]@Polygons[[1]]@coords,2,range))
  xyrange <- apply(do.call(rbind,xyrange),2,range)* (c(0.999,1.001))
  
  par(cex=0.8,mar=c(4,4,1,1))
  plot(1,xlim=xyrange[,1],ylim=xyrange[,2],xlab='',ylab='')
  lapply(1:length(tag), function(i) 
    lines(county@polygons[[tag[i]]]@Polygons[[1]]@coords,type='l',col=1,...))
  sp::compassRose(grconvertX(legend.pos[1], "npc"),grconvertY(legend.pos[2], "npc"),cex=0.8)
  
  with(county.pos,points(lon,lat))
  with(county.pos,text(lon,lat,county,pos=county.pos[,'text.pos']))
  mtext(~Longitude~(degree),side=1,line=2.5)
  mtext(~Latitude~(degree),side=2,line=2.5)
  cat("A suggested figure size:",round(c(diff(xyrange[,1])/diff(xyrange[,2]),1)*5,1),"\n")
}
