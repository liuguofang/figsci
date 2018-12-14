## internal functions 

sci.search <- function(dat = sci,journal=NULL,type=NULL,IF5.threshold=NULL,yr=NULL){

    if(!is.null(type)) {
        dat <-  subset(dat,get(type)!='')
        type <- paste0(toupper(substr(type,1,1)),substr(type,2,nchar(type)))
        }
    dat <- dat[with(dat,order(year,decreasing=TRUE)),]
    if(is.null(journal))  journal <- '.'
    pos <- unlist(lapply(1:length(journal),
                         function(x) grep(tolower(journal[x]),tolower(dat$Full.Journal.Title))))
    case <- dat[pos,]
                            
    if(!is.null(IF5.threshold)) {
        options(warn=-1)
        case <- case[as.numeric(as.character(case$IF5))>IF5.threshold,]
        options(warn=0)
        }
    case <- subset(case,!is.na(Rank))
    if(!is.null(yr))                         
        case[with(case,year %in% yr),] else case                         
}

                         
