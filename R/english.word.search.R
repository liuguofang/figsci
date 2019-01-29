english.word.search <- function(string=''){
	tag <- grep(string,english.words$words)
	if(length(tag)==0)
		tag <- grep(string,english.words$meaning)
	out <- english.words[tag,]

	fix(out) # show the results
}

