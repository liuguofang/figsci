#' An item.slide function building a slide including multiple items.
#' @frametitle title of slide.
#' @font.size font size. default is normalsize.
#' @item.text a vectors of multiple items
#' @footnote add a refence as footnote.


item.slide <- function(frametitle,font.size="\\normalsize",item.text, footnote){
    cat("\\begin{frame}\n")
    cat(sprintf("  \\frametitle{%s}\n",frametitle))
    cat(sprintf("   %s\n",font.size))
    cat("  \\begin{itemize}\n")
    for(i in 1:length(item.text))
        cat(sprintf("    \\item %s\n",item.text[i]))
    cat("  \\end{itemize}\n")
    cat(sprintf("    \\footnote{(%s)}\n",footnote))
    cat("\\end{frame}\n")      
        
}
