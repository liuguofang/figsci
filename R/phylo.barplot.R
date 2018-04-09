#' A phylo.barplot Function
#'
#' This function allows you draw a phylogenetic tree and associated barplot.
#' @phylo A phylogenetic tree .
#' @dat traits
#' @export
#' @examples
phylo.barplot=function(phylo,dat,SE=NULL,var.lab=NULL, ...){
	
	par(mar = rep(0,4), omi = c(0.15, 0.5, 0.1, 0.1), mgp = c(0.8, 0.5, 0), xpd = NA)
	barplot.no = ncol(dat) - 1
	layout(matrix(1:(barplot.no + 1), nrow = 1), width = c(4 * 5/(barplot.no + 1), rep(5/(barplot.no + 1), barplot.no)))
	plot.phylo(phylo, show.tip.label = TRUE, show.node.label = TRUE, adj = 1,  xpd = TRUE, ...)
	
	y0 <- grconvertY(1:length(phylo$tip.label), from = "user", to = "npc")
	
	for (i in 1:barplot.no) {
		value = dat[, i + 1]
		if(is.null(SE)) value.se=0 else  value.se = traits.se[, i + 1]
		diagram::openplotmat(xlim = c(0, 1.05 * max(value + value.se)))
		y02 <- grconvertY(y0, from = "npc", to = "user")
		change <- diff(grconvertY(0:1, "npc")) * 0.005 # can modulate bar thickness
		
		for (j in 1:N) rect(0, y02[j] - change, value[j], y02[j] + change, col = "blue")
		if(!is.null(SE))
			arrows(value - value.se, y02, value + value.se, y02, code = 3, length = 0.02, angle = 90)
		axis(1, tcl = 0.5, line = -0.5)
		if(is.null(var.lab)) mtext(names(traits)[i+1],side=3,line=-1) else 
			mtext(var.lab[i],side = 3, line= -1)
	}
}
