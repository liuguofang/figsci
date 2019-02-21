author.packages <- function(author,...){
	ob <- sos::findFn(author,...)
	packs <- sub("library/",'',unique(ob$Package))
	packs.web <- sprintf("https://cran.r-project.org/web/packages/%s/index.html",packs)
	out <- plyr::llply(packs.web,readLines)
	author2 <- plyr::laply(out,.fun=function(lst){
				if(length(grep(author,lst))) 'author' else 'no author'})
	unique(packs[author2=='author'])
}
