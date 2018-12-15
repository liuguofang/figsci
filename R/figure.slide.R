#' A figure.slide function
#' This function can be used to build PPT slide based on Latex software.
#' @topdown valid when two figures are shown. default is left-right layout, top-down layout if it is TRUE. 
#' @frametitle title of slide.
#' @figure.fold figure fold position.
#' @font.size font size. default is normalsize.
#' @layout the slide space is divided into 2 or several parts.
#' @width the figures' width.
#' @caption.text the caption of figure(s).
#' @footnote add a refence.

figure.slide <- function(topdown=FALSE, frametitle,figure.fold, font.size="\\normalsize",
                          layout=c(0.5,0.5), width = c(5, 5), fig.name, caption.text, footnote){
    cat("\\begin{frame}\n")
    cat(sprintf("  \\frametitle{%s}\n",frametitle))
    cat(sprintf("   %s\n",font.size))
    
    cat("\\begin{figure}\n")
    if(!topdown)     cat("    \\begin{columns}\n")
    for(i in 1:length(layout)){
        if(!topdown)    cat(sprintf("        \\column{%s\\textwidth}\n",layout[i]))
        cat("        \\begin{center}\n")
        cat(sprintf("            \\includegraphics[width=%scm]{%s/%s}\\\\\n",width[i],figure.fold,fig.name[i]))
        cat(sprintf("            \\caption{%s}\n",caption.text[i]))
        cat("            \\label{fig:side:a}\n")
        cat("        \\end{center}\n")
    }
    if(!topdown) cat("    \\end{columns}\n")
    cat("\\end{figure}\n")
    cat(sprintf("    \\footnote{(%s)}\n",footnote))

    cat("\\end{frame}\n")
}
