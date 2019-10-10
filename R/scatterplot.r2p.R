#' A scatterplot.r2p function
#' This function can be used drawing a scatterplot with or without category/group variable and add R2 and P-value for fitted regession lines automatically.
#' @dat A data.frame 
#' @x A variable in x axis
#' @y A variable in y axis
#' @group A group variable. The group default is NULL. 
#' @color Feed color array for different groups.
#' @pty Feed array on point types. 
#' @cex.size Cex size in figure options. 
#' @cornerlabel Add a marker at corner position. 
#' @r2.p.pos The position of r2.p which ranges from (0,1) for x and y axises.
#' @level.off Whether level is shown or not. 
#' @examples

scatterplot.r2p <- function (dat, x = x, y = y, group = NULL, color = NULL, 
			     pty = NULL, cex.size = 1, cornerlabel = NULL, 
			     r2.p.pos = c(0.1, 0.95),level.off = FALSE,blank=0, ...) 
{
    x.variable <- dat[, x]
    y.variable <- dat[, y]
    
    if (is.null(group)) {
        lm.whole <- lm(y.variable ~ x.variable)
        # r2, p, x1, x2
        lm.coef <- data.frame(a = coef(lm.whole)[1], 
                            b = coef(lm.whole)[2],
                            R2 = summary(lm.whole)$r.squared,
                            p = summary(lm.whole)$coef[8], 
                            x1 = min(lm.whole$model$x.variable, na.rm = TRUE), 
                            x2 = max(lm.whole$model$x.variable, na.rm = TRUE))

        plot(x.variable, y.variable, pch = ifelse(is.null(pty), 1, pty[1]), 
                       col = ifelse(is.null(color), "black", color[1]),...)
        with(lm.coef, plotrix::ablineclip(a = a, b = b, 
                x1 = x1, x2 = x2, lty = ifelse(p < 0.05, 1, 0)))
       
 
        lm.coef <- transform(lm.coef,p=ifelse(p<0.001,'< 0.001',paste('==',round(p,3))),
					R2=ifelse(R2<0.01,'< 0.01',paste('==',round(R2,2))))
        txt <- as.formula(sprintf("R^2%s~italic(P)%s", lm.coef$R2,lm.coef$p))
        
        r2.p.pos[1] <- grconvertX(r2.p.pos[1], "npc")
        r2.p.pos[2] <- grconvertY(r2.p.pos[2], "npc")
        text(r2.p.pos[1], r2.p.pos[2],txt, cex = cex.size, adj=0) 
    } else
    {
        group <- dat[, group]
        if (!is.factor(group)) 
            group <- factor(group)
        dat <- data.frame(x.variable, y.variable, group)
        group.string <- levels(group)
        group.no <- length(levels(group))

        if (is.null(pty)) 
            pty = c(1, 19, 2, 17, 22, 15, 5, 18, 12, 14, 8, 4)[1:group.no]
        if (length(pty) == 1) {
            pty = rep(pty, group.no)
            dat$pty = pty[1]
        }
        else dat$pty <- as.numeric(as.character(factor(group, 
            level = levels(group), label = pty)))

        library(plyr)
        lm.out <- dlply(dat, .(group), function(df) lm(y.variable ~ 
            x.variable, data = df))
        lm.coef <- ldply(lm.out, function(lt) c(a = as.vector(coef(lt))[1], 
            b = as.vector(coef(lt))[2], R2 = summary(lt)$r.squared, 
            p = coefficients(summary(lt))[2, 4], x = range(lt$model$x.variable, 
                na.rm = TRUE)))
        lm.coef$lty <- ifelse(lm.coef$p < 0.05, 1, 0)
       
        lm.coef <- transform(lm.coef,p = ifelse(p<0.001,'< 0.001',paste('==',round(p,3))),
			     R2 = ifelse(R2<0.01,'< 0.01', paste('==',round(R2,2))), 
			     lty=ifelse(p<0.05,1,0))
       
        txt <- vector('expression',group.no)
        value <- max(nchar(group.string))-nchar(group.string)+1+blank
        space <- sapply(value,function(s) paste(rep("~",time=s),collapse=''))
        for(i in 1:group.no) 
           txt[[i]] <- as.formula(sprintf("%s%sR^2%s~italic(P)%s", ifelse(level.off,'',group.string[i]),
					  ifelse(level.off,'',space[i]), lm.coef$R2[i], lm.coef$p[i]))

        levels(group) <- pty[1:group.no]
        if (is.null(color)) 
            color = as.numeric(lm.coef$group)
        else if (length(color) == 1) 
            color <- rep(color, group.no)
        lm.coef$color <- color
        with(dat, plot(x.variable, y.variable, pch = pty, col = color[as.numeric(group)], 
            ...))
        r2.p.pos[1] <- grconvertX(r2.p.pos[1], "npc")
        r2.p.pos[2] <- grconvertY(r2.p.pos[2], "npc")       
    
        if (!is.null(cornerlabel)) 
            plotrix::corner.label(x = -1, y = 1, label = cornerlabel)     

       d_ply(lm.coef,.(group), .fun=function(dt) with(dt,
                     plotrix::ablineclip(a=a,b=b,col=color,x1=x1,x2=x2, lty=lty)))
       legend(r2.p.pos[1],r2.p.pos[2],yjust = 0.5,legend=txt, pch = pty,  col = color, 
               lty = lm.coef$lty, bty = "n",adj=0, cex = cex.size, text.col=color)
       }
}
