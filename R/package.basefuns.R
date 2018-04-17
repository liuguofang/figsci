package.basefuns <- function(package.name){
    library(package.name,character.only = TRUE)
    library(plyr)
    library(stringr)
    obj <- ls(str_interp("package:${package.name}"))
    tag <- laply(obj,function(s) is.function(get(s)))
                 funs <- obj[tag]
                 output <- llply(funs,function(s) 
                     codetools::findGlobals(get(str_interp("${s}"))))
                                 table(unlist(output))
}