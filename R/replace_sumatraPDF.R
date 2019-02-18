
replace_sumatraPDF <- function(settings.file, SumatraPDF.settings.place = NULL){
    dir.pos <- getwd()
    file <- paste(dir.pos,settings.file,sep='\\')
    new.name.file <- paste(dir.pos,"SumatraPDF-settings.txt",sep='\\')
    file.copy(file,new.name.file)
    
    if(is.null(SumatraPDF.settings.place)){
      user <- dir("C:\\Users")[which(!(dir("C:\\Users") %in% 
      	c("All Users", "Default", "Default User", "desktop.ini", "Public")))]
     SumatraPDF.settings.place <- sprintf( "C:\\Users\\%s\\AppData\\Roaming\\SumatraPDF",user)
    }
 
    cmd <- sprintf("replace \"%s\"  \"%s\"",new.name.file,SumatraPDF.settings.place)
    lapply(cmd,shell)
    file.remove(new.name.file)
    browseURL("C:\\Program Files\\SumatraPDF\\SumatraPDF.exe")
}
