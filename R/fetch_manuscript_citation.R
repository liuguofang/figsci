#' A fetch_manuscript_citation Function
#'
#' This function allows you  to fetch citation from main text in your manuscript.
#' @txt a txt file from main text in manuscript.
#' @export
#' @examples

fetch_manuscript_citation <- function(txt) {
	
	txt <- paste(txt, collapse = " ")
	
	start = gregexpr("\\(", txt)[[1]]
	end = gregexpr("\\)", txt)[[1]]
	pos = cbind(start, end)
	res = lapply(1:nrow(pos), function(i) substr(txt, pos[i, 
								1], pos[i, 2]))
	
	res = unlist(res)
	tag = gregexpr("[0-9]{4}", res)
	
	tag2 = NULL
	for (i in 1:length(res)) tag2[i] = tag[[i]] != -1
	result = res[tag2]
	
	result = gsub("\\(|\\)", "", unlist(strsplit(result, 
							";")))
	result <- gsub("^ ", "", result)
	result <- sort(unique(result))
	
	unexpected = grep("^[0-9]", result)
	
	
	list(result[-unexpected], result[unexpected])
}

