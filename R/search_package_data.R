search_package_data <- function(package.name='smatr'){
  library(dplyr)
  package.dat <- data(package = package.name)
  package.dat.files <- package.dat$results[,3]
  package.dat.files.info <- package.dat$results[,4]
  data(list=package.dat.files,package = package.name)
  for(i in 1:length(package.dat.files))
  {
    cat("\n",package.dat.files.info[i])
    cat("\n",package.dat.files[i],"\n")
    dt <- package.dat.files[i] %>% get
    if(class(dt)!='list') dt %>% summary %>% print()
    else {
      dt %>% summary %>% print()
      for(j in 1:length(dt)){
        dt[[j]] %>% summary %>% print()
      }

    }
  }
}