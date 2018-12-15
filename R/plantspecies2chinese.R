#' A plantspecies2chinese function
#'
#' This function can be used to transform plant species latin into chinese name by visiting  \url{http://www.cvh.ac.cn/search/} (中国数字标本馆).
#' @species the vector of species name.
#' @examples 

plantspecies2chinese <- function(species){
	website <- sprintf("http://www.cvh.ac.cn/search/%s?n=1",sub(" ","%20",gsub(" $","",species)))
	sp.name <- rep("",length(website))
	for(i in 1:length(website)){
		txt <- readLines(website[i],encoding='UTF-8')
		txt2 <- txt[grep("查看",txt)]
		txt3 <- substr(txt2,regexpr("查看",txt2),regexpr("查看",txt2)+800)
		string <- "height='12px' width='12px'></a></td><td class='td3'>"
		pos <- regexpr(pattern =string ,txt3)
                if(length(pos)!=0)
		sp.name[i] <- gsub("[a-z|A-Z|<>/ ]","",substr(txt3,pos+nchar(string),pos+nchar(string)+10))
	}
	
	data.frame(species,sp.name)
}
