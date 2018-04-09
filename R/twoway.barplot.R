#' A twoway.barplot function
#'
#' This function is used as drawing two-way barplot and adding letters representing significant difference.
#' @dat Dataframe 
#' @x.factor A category variable at the x axis.
#' @method one of multiple contrast approach in HSD.test, duncan.test, LSD.test etc in agricolae package. The default is Tukey HSD.test. 
#' @response A contineous response variable. 
#' @group  A group variable at the y axis.
#' @maximum  Which is used to modify visualtion on significant letters in figure. 
#' @export
#' @examples
twoway.barplot <-function(dat, x.factor = "x.factor",response = "response", group = "group", method = 'HSD.test', maximum=NULL,
                          legend.pos='topright',group.name=group, ...) {
  library(sciplot)
  library(doBy)
  library(agricolae)
  dat = dat[c(x.factor, response, group)]
  names(dat) = c("x.factor", "response", "group")
  if (!is.factor(dat$x.factor)) 
    dat$x.factor <- factor(dat$x.factor)
  if (!is.factor(dat$group)) 
    dat$group <- factor(dat$group)
  CI = summaryBy(response ~ x.factor + group, data = dat, FUN = c(mean, se))
  CI = transform(CI, h = response.mean + response.se, l = response.mean - response.se)
  Max = max(CI$h)
  group.range = cbind(split(CI, CI$group)[[1]]["h"], split(CI, CI$group)[[2]]["l"])
  para = bargraph.CI(x.factor, response, group, ylim = c(0, ifelse(is.null(maximum),Max*1.2,maximum)), data = dat,...)
  
  group.level = levels(dat$group)
  x.factor.level = levels(dat$x.factor)
  split.dat = split(dat, dat$group)
  lett.group <- lett.xfactor <-  matrix(NA, ncol = length(x.factor.level), nrow = length(group.level))
  
  for (i in 1:length(group.level)) {
    model = aov(response ~ x.factor, data = split.dat[[i]])
    lett = get(method)(model, "x.factor")$group
    lett.group[i,] = toupper(lett[match(x.factor.level,row.names(lett)),'groups'])
  }
  
  for (j in 1:length(x.factor.level)) {
    oneset = subset(dat, x.factor == x.factor.level[j])
    model2 = aov(response ~ group, data = oneset)
    lett2 = get(method)(model2, "group")$group
    lett.xfactor[,j] <- as.character(lett2[match(group.level,row.names(lett2)),'groups'])
  }
  
  sig.letters=matrix(paste0(matrix(lett.group),matrix(lett.xfactor)),ncol=length(x.factor.level))
  for (i in 1:length(x.factor.level)) 
    text(para$xvals[, i], para$CI[2, , i] + par("usr")[4] * 0.03, sig.letters[, i]) 
  legend(legend.pos,legend =c(group.name,group.level),pch=c(NA,rep(22,length(group.level))),pt.bg=c(NA,gray.colors(length(group.level))),...)
  }


