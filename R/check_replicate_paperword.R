check_replicate_paperword <- function(txt)
{
    # overcome Error in nchar(z) : invalid multibyte string 3
    Sys.setlocale("LC_ALL", "C")
    unchange.txt <- txt
    txt <- unlist(strsplit(txt, " "))
    txt <- gsub("[[:punct:]]", "", txt)
    word_count = length(txt)
    replicateword_position <- rep(0, word_count)
    
    for (i in 2:word_count) 
    if (txt[i] == txt[i - 1] & txt[i] != "") 
        replicateword_position[i] = 1
    word <- txt[which(replicateword_position == 1)]
    tag <- rep(NA, length(word))
    for (j in 1:length(word)) {
        tag[j] <- ifelse(length(grep(paste(word[j], word[j]), 
            paste(unchange.txt, collapse = " "))), 1, NA)   
    }
    word[!is.na(tag)]
}
