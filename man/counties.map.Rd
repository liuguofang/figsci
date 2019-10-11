\name{counties.map}
\alias{counties.map}
\title{Draw one or more counties map of China}
\usage{
counties.map(county.polygon.dir = "E:/analysis and graphics/R.eclipse/data/GIS-地图/县级行政界线",
                      county.pos = "E:/analysis and graphics/R.eclipse/data",					   
                      counties,text.pos = 1,legend.pos= c(0.9,0.9),scale.pos = c(0.05,0.05),
                      strange.polygon=FALSE,...)
}
\description{
This function can be used to draw one or more counties map of China.
}

\arguments{
	\item{county.polygon.dir} {the place of county shape files.}
	\item{counties} {the array of counties in China.}
	\item{text.pos} {the position of county names with 1-4 representing below, left, above and left of points. }
	\item{legend.pos} {the position of legend (0, 0) and c(1,1) denote leftbottom and righttop place wherethe legend appears. }
	\item{text.pos} {the position of county names with 1, 2, 3, 4 representing below, left, above and left of points respectively. }
	\item{scale.pos} {the position of distance scale. }
	\item{strange.polygon} {remove strange polygons representing far way from focused map regions.}
	\item{color} {filled color for polygons. It can be used to fill different colors for different cities.}
	\item{offset} {ajust the distance between point character and associated text.}
	\item{ ...} {futher arguments to pass \code{\link{lines}} function.}
}

\examples{

setwd("E:/analysis and graphics/R.eclipse/data/GIS-地图/县级行政界线")

county.zhumadian <- c("驻马店", "确山县", "泌阳县", "遂平县", "西平县", "上蔡县", "汝南县", "平舆县", "正阳县", "新蔡县")
zhumadian.colors <- colors()[c(395, 419, 92, 419,468, 92,395,419,92,468)]
tiff(file=paste0('驻马店地图(',Sys.Date(),").tiff"),res=600,unit='in',width=6.3,height=5,compression ='lzw')
counties.map(counties = county.zhumadian,color=zhumadian.colors,text.pos= c(1,1,3,1,1,4,1,1,1,1))
dev.off()

county.ordos <- c("东胜市", "达拉特旗", "准格尔旗", "鄂托克前旗", "鄂托克旗", "杭锦旗", "乌审旗", "伊金霍洛旗" )
ordos.colors <- colors()[c(395, 419, 92, 419,468, 92,395,419)]
tiff(file=paste0('鄂尔多斯地图(',Sys.Date(),").tiff"),res=600,unit='in',width=5.7,height=5,compression ='lzw')
counties.map(counties =county.ordos,text.pos=c(4,1,3,3,3,3,3,1),color=ordos.colors,offset=0.4)
dev.off()

maowusu <- read.table('clipboard',h=T)
with(maowusu,polygon(Longitude, Latitude))

county.hhht <- c("呼和浩特市", "武川县", "托克托县", "清水河县", "和林格尔县", "土默特左旗")
hhht.colors <- colors()[c(395, 419,419, 92, 468, 92)]
tiff(file=paste0('呼和浩特地图(',Sys.Date(),").tiff"),res=600,unit='in',width=4.5,height=5,compression ='lzw')
counties.map(counties =county.hhht,text.pos=c(1,2,4,1,4,1),color=hhht.colors,legend.pos = c(0.85,0.85))
dev.off()

county.baotou  <- c("达尔罕茂明安联合旗","包头", "固阳县", "土默特右旗" )
baotou.colors <- colors()[c(92, 419, 395,468 )]

tiff(file=paste0('包头地图(',Sys.Date(),").tiff"),res=600,unit='in',width=4.1,height=5,compression ='lzw')
counties.map(counties =county.baotou,text.pos=c(1,3,1,1),color=baotou.colors,legend.pos = c(0.8,0.9))
dev.off()

cities3 <- list(county.ordos,county.hhht,county.baotou)
cities3.pos <- list(c(4,1,3,3,3,3,3,1),
				c(1,2,4,1,4,1),
				c(1,3,1,1))
cities3.color=rep(colors()[c(92, 419, 395 )],times=sapply(cities3,length))		

tiff(file=paste0('呼和浩特鄂尔多斯包头组合地图地图(',Sys.Date(),").tiff"),res=600,unit='in',width=8.46,height=9,compression ='lzw')
counties.map(counties =unlist(cities3),text.pos=unlist(cities3.pos),color=cities3.color,legend.pos = c(0.9,0.9))
dev.off()

county.handan <- c("临漳县", "成安县","武安市","肥乡县","邯郸县", "永年县","大名县", "涉县", "磁县",  "鸡泽县", "广平县", "馆陶县", "魏县", "曲周县", "邯郸市")
handan.colors <- colors()[c( 468, 419,419,395 ,468, 92,468,395,92,468,92,395,395,419,395)]

tiff(file=paste0('邯郸地图(',Sys.Date(),").tiff"),res=600,unit='in',width=6.9,height=5,compression ='lzw')
counties.map(counties =county.handan,text.pos=c(1,1,2,4,4,4,4,4,2,1,4,2,1,1,1),color=handan.colors,legend.pos = c(0.9,0.9))
dev.off()


inner.mong.county <-list(c("呼和浩特", "土默特左旗", "托克托县", "和林格尔县", "清水河县", "武川县"),
		c("包头", "土默特右旗", "固阳县", "达尔罕茂明安联合旗"),
		"乌海",
		c("赤峰", "阿鲁科尔沁旗", "巴林左旗", "巴林右旗", "林西县", "克什克腾旗", "翁牛特旗", "喀喇沁旗", "宁城县", "敖汉旗"),
		c("海拉尔", "满洲里", "扎兰屯", "牙克石", "额尔古纳", "根河", "阿荣旗", "莫力达瓦达斡尔", "鄂伦春", "鄂温克族", "新巴尔虎右旗", "新巴尔虎左旗", "陈巴尔虎旗"),
		c("兴安盟", "乌兰浩特", "阿尔山", "科尔沁右翼前旗", "科尔沁右翼中旗", "扎赉特旗", "突泉"),
		c("通辽", "霍林郭勒", "科尔沁左翼中旗", "科尔沁左翼后旗", "开鲁", "库伦旗", "奈曼旗", "扎鲁特旗"),
		c("锡林郭勒", "锡林浩特", "二连浩特", "阿巴嘎旗", "苏尼特左旗", "苏尼特右旗", "东乌珠穆沁旗", "西乌珠穆沁旗", "太仆寺旗", "镶黄旗", "正镶白旗", "正蓝旗", "多伦"),
		c("乌兰察布", "集宁", "丰镇", "卓资", "化德", "商都", "兴和", "凉城", "察哈尔右翼前旗", "察哈尔右翼中旗", "察哈尔右翼后旗", "四子王旗"),
		c( "东胜", "达拉特旗", "准格尔旗", "鄂托克前旗", "鄂托克旗", "杭锦旗", "乌审旗", "伊金霍洛旗"),
		c("临河", "五原", "磴口", "乌拉特前旗", "乌拉特中旗", "乌拉特后旗", "杭锦后旗"),
		c( "阿拉善左旗", "阿拉善右旗", "额济纳旗"))


 innermong.colors = rep(colors()[c(395, 419, 92, 419,468, 92, 51, 395, 419, 51,92, 395)],
		 times=sapply(inner.mong.county,length))
 

txt.pos <-c(1, 1, 4, 3, 1, 2,
		 4, 1, 3, 1,
		 4,
		 2, 1, 3, 4, 3, 1, 4, 2, 2, 4,
		 4, 1, 2, 4, 1, 1, 3, 3, 1, 1, 1, 3, 3,
		 1, 3, 1, 2, 1, 2, 4,
		 2, 2, 4, 4, 3, 2, 3, 1,
		 1, 1, 1, 3, 2, 3, 1, 3, 1, 4, 3, 3, 4,
		 1, 4, 1, 2, 4, 4, 4, 1, 1, 3, 3, 3,
		 4, 1, 3, 3, 3, 3, 3, 1,
		 1, 2,3, 4, 3, 2, 2,
		 2, 3, 1)
 
tiff(file=paste0('内蒙古地图(',Sys.Date(),").tiff"),res=600,unit='in',width=14.4,height=10,compression ='lzw')
counties.map(counties =unlist(inner.mong.county),color = innermong.colors,text.pos=txt.pos,legend.pos = c(0.1,0.9),
		scale.pos = c(0.2,0.88),cex=0.7)
dev.off()



#  "2017-10-23 17:09:33 CST"
## four sandland

sandland<- list(c("满洲里", "新巴尔虎右旗", "新巴尔虎左旗", "海拉尔", 
				"通辽",   "科尔沁左翼后旗", "奈曼旗","巴林左旗","巴林右旗","赤峰","克什克腾旗","翁牛特旗",
				"锡林浩特", "阿巴嘎旗", "苏尼特左旗", "苏尼特右旗","镶黄旗",  "正蓝旗", "多伦",
				"临河","乌海","杭锦旗","鄂托克前旗","鄂托克旗","东胜","准格尔旗", "乌审旗", "伊金霍洛旗"),
		c("银川","石嘴山","吴忠市","中卫","盐池县","定边县","靖边县","榆林市"))

inner.mong.county[13] <- sandland[2]
txt.pos <- c(txt.pos, rep(1,length(sandland[[2]])))

color <- rep('white',length(unlist(inner.mong.county)))

color[match(unlist(sandland),unlist(inner.mong.county))] <- colors()[92]

tiff(file=paste0('中国四大沙地(',Sys.Date(),").tiff"),res=600,unit='in',width=17.8,height=10,compression ='lzw')
counties.map(counties =unlist(inner.mong.county),color =color,text.pos=txt.pos,legend.pos = c(0.1,0.9))
dev.off()

henan.county<-list(c("郑州市", "巩义市", "荥阳市", "新密市", "新郑市", "登封市", "中牟县"),
		c("开封市", "杞县", "通许县", "尉氏县", "开封县", "兰考县"),
		c("洛阳市", "偃师市", "孟津县", "新安县", "栾川县", "嵩县", "汝阳县", "宜阳县", "洛宁县", "伊川县"), 
		c("平顶山市", "舞钢市", "汝州市", "宝丰县", "叶县", "鲁山县", "郏县"), 
		c("焦作市", "沁阳市", "孟州市", "修武县", "博爱县", "武陟县", "温县"), 
		c("鹤壁市", "浚县", "淇县"), 
		c("新乡市", "卫辉市", "辉县市", "新乡县", "获嘉县", "原阳县", "延津县", "封丘县", "长垣县"),
		c("安阳市", "林州市", "安阳县", "汤阴县", "滑县", "内黄县"), 
		c("濮阳市", "清丰县", "南乐县", "范县", "台前县", "濮阳县"), 
		c("许昌市", "禹州市", "长葛市", "许昌县", "鄢陵县", "襄城县"), 
		c("漯河市", "舞阳县", "临颍县", "郾城县"),
		c("三门峡市", "义马市", "灵宝市", "渑池县", "陕县", "卢氏县"), 
		c("南阳市", "邓州市", "南召县", "方城县", "西峡县", "镇平县", "内乡县", "淅川县", "社旗县", "唐河县", "新野县", "桐柏县"), 
		c("商丘市", "永城市", "民权县", "睢县", "宁陵县", "柘城县", "虞城县", "夏邑县"), 
		c("信阳市", "罗山县", "光山县", "新县", "商城县", "固始县", "潢川县", "淮滨县", "息县"), 
		c("周口市", "项城市", "扶沟县", "西华县", "商水县", "沈丘县", "郸城县", "淮阳县", "太康县", "鹿邑县"), 
		c("驻马店市", "西平县", "上蔡县", "平舆县", "正阳县", "确山县", "泌阳县", "汝南县", "遂平县", "新蔡县"), 
		"济源市")

henan.colors <- rep(colors()[c(395, 419, 92, 419,468, 92, 51, 395, 419, 51,92, 395, 51, 4, 419, 468, 395,419)],
		times=sapply(henan.county,length))

henan.pos <- c(1, 1, 1, 1, 1, 1, 1,
		2, 1, 1, 1, 4, 4,
		3, 1, 3, 3, 3, 1, 1, 2, 2, 4, 
		1, 1, 3, 3, 4, 2, 3, 
		3, 3, 1, 1, 3, 3, 1, 
		1, 3, 3,
		1, 3, 3, 1, 1, 1, 3, 3, 4,
		3, 3, 4, 4, 1, 3, 
		3, 4, 3, 1, 1, 1, 
		1, 2, 4, 4, 1, 4, 
		4, 3, 4,2, 
		4, 1, 3, 3, 1, 1, 
		1, 1, 1, 2, 3, 3, 3, 2, 1, 1, 4, 3, 
		1, 1, 4, 1, 3, 3, 4, 4, 
		1, 1, 2, 4, 1, 1, 4, 2, 4, 
		1, 1, 3, 3, 1, 4, 4, 1, 3, 2, 
		1, 2, 4, 3, 4, 1, 3, 1, 2, 3, 
		2)


tiff(file=paste0('河南省地图(',Sys.Date(),").tiff"),res=600,unit='in',width=7.14,height=7,compression ='lzw')
counties.map(counties =unlist(henan.county),text.pos=henan.pos, color=henan.colors,legend.pos = c(0.1,0.9),cex=0.6,strange.polygon=TRUE)
dev.off()
}
