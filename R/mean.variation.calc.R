#' A mean.variation.calc function
#'
#' This function can calcualte mean and SD/SE based on categories and do multiple comparisons.
#' @dat a data.frame 
#' @id.vars Categories array 
#' @SD Default is calculating SE, if SD = TRUE, it only calculates SD.
#' @multicom.group Provide a group variable used for mulitple comparisons
#' @export
#' @examples
mean.variation.calc <- function(dat,id.vars = id.vars,SD=FALSE,multicom.group='multicom.group', method = 'HSD.test'){
    library(agricolae)
    dat <- reshape::melt(data = dat, id.vars = id.vars)
  mean.variation <- plyr::ddply(.data = dat, c('variable',id.vars),.fun=function(dt){
  
  out1 <- data.frame(M.SE = sprintf("%.2f %s %.2f",mean(dt$value,na.rm = TRUE),stringr::str_conv("\xb1","ISO-8859-1"),
  ifelse(SD,sd(dt$value,na.rm=TRUE),sciplot::se(dt$value,na.rm=TRUE))))
    if(SD) names(out1) <- c('M.SD')
    out1
  })
  
  if(!is.factor(dat[,multicom.group])) dat[,multicom.group] <- factor(dat[,multicom.group])
  letters <- plyr::ddply(.data=dat, c('variable'),.fun=function(dt){
    level <-levels(dat[, multicom.group])
    
    model <- aov(value~dt[, multicom.group],data=dt)
    lett <- get(method)(model,"dt[, multicom.group]")$groups
    out2=data.frame(multicom.group=level,letter=lett[level,'groups'])
    out2 <- plyr::rename(out2,replace = c("multicom.group" = multicom.group))
    out2
  })
  output <- plyr::join(mean.variation,letters)
  N <- ncol(output)
  output[,N-1] <- sprintf("%s%s",output[,N-1],output[,N])
  output[,-N]
}

