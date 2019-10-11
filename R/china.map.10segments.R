china.map.10segments <- function(pt.dat =NULL,pt.text =NULL, ...){
    library(mapdata)
    library(maps)
    par(mar=rep(0,4),mgp=c(1.2,0.5,0),omi=c(0.1,0.1,0,0))
    map("china",xlim=c(70,140),ylim=c(15,55))
    box()

    if(!is.null(pt.dat))
      points(pt.dat[,1],pt.dat[,2],...)
    if(!is.null(pt.text))
      text(pt.dat[,1],pt.dat[,2],pt.text,...)

    abline(v=seq(80,130,by=10),h=seq(10,50,by=10),lty=2,col='gray')
    axis(1,at=seq(80,120,by=10),label=seq(80,120,by=10),tcl=0)
    axis(2,at=seq(10,50,by=10),label=seq(10,50,by=10),las=2,tcl=0)
    mtext(expression(paste("Longtitude ("^o,"E)")),side=1,line=1.5)
    mtext(expression(paste("Latitude ("^o,"N)")),side=2,line=1.5)
    para=par('usr')
    for(i in 1:length(line10))
      lines(line10[[i]])

    do.research::north.direction(0.7,0.7)
    
    rect(para[2]-15,0,para[2],32,col='white')
    par(usr=c(50,50+para[2]-para[1],3,3.5+para[4]-para[3]))
    map('china',xlim=c(100,120),ylim=c(-5,20),add=T,bg='white')
    box()
    data(line10,package='figsci')
    for(i in 1:length(line10))
      lines(line10[[i]])
}
