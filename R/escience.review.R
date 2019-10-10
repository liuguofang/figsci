
escience.review <- function(author)
{
	content <- readLines(sprintf("http://www.escience.cn/people/%s/index.html",author),encoding='UTF-8')
	content2 <- paste0(content,collapse='')
	out <- substr(content2,gregexpr("累计访问量",content2)[[1]],gregexpr("累计访问量",content2)[[1]]+10)
	paste(Sys.Date(),regmatches(out,gregexpr("[0-9]{1,4}",out))[[1]],sep=':')
}

