author.packages <- function(author,ignore.case = TRUE,...){
  if (!requireNamespace("sos", quietly = TRUE)) stop("Please install 'sos' package.")
  if (!requireNamespace("plyr", quietly = TRUE)) stop("Please install 'plyr' package.")
  
  ob <- sos::findFn(author, ...)
  packs <- sub("library/", '', unique(ob$Package))
  packs.web <- sprintf("https://cran.r-project.org/web/packages/%s/index.html", packs)
  
  message("Checking ", length(packs), " packages on CRAN...")
  out <- plyr::llply(packs.web, function(url) {
    tryCatch(readLines(url, warn = FALSE), error = function(e) character(0))
  }, .progress = "text")
  
  author2 <- plyr::laply(out, function(lst) {
    if (length(grep(author, lst, ignore.case = ignore.case))) 'author' else 'no author'
  })
  
  res <- unique(packs[author2 == 'author'])
  print(res)
  invisible(res)
}
