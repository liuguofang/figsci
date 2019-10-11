GPS2kml <- function(points, filename) {
	example <- c("<?xml version=\"1.0\" encoding=\"UTF-8\"?>",
			"<kml xmlns=\"http://www.opengis.net/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\" xmlns:kml=\"http://www.opengis.net/kml/2.2\" xmlns:atom=\"http://www.w3.org/2005/Atom\">", 
			"<Document>", "\t<name>example.kml</name>", "\t<Style id=\"s_ylw-pushpin_hl\">", 
			"\t\t<IconStyle>", "\t\t\t<scale>1.3</scale>", "\t\t\t<Icon>", 
			"\t\t\t\t<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>", 
			"\t\t\t</Icon>", "\t\t\t<hotSpot x=\"20\" y=\"2\" xunits=\"pixels\" yunits=\"pixels\"/>", 
			"\t\t</IconStyle>", "\t</Style>", "\t<StyleMap id=\"m_ylw-pushpin\">", 
			"\t\t<Pair>", "\t\t\t<key>normal</key>", "\t\t\t<styleUrl>#s_ylw-pushpin</styleUrl>", 
			"\t\t</Pair>", "\t\t<Pair>", "\t\t\t<key>highlight</key>", "\t\t\t<styleUrl>#s_ylw-pushpin_hl</styleUrl>", 
			"\t\t</Pair>", "\t</StyleMap>", "\t<Style id=\"s_ylw-pushpin\">", 
			"\t\t<IconStyle>", "\t\t\t<scale>1.1</scale>", "\t\t\t<Icon>", 
			"\t\t\t\t<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>", 
			"\t\t\t</Icon>", "\t\t\t<hotSpot x=\"20\" y=\"2\" xunits=\"pixels\" yunits=\"pixels\"/>", 
			"\t\t</IconStyle>", "\t</Style>", "\t<Placemark>", "\t\t<name>example</name>", 
			"\t\t<LookAt>", "\t\t\t<longitude>109.6311429308415</longitude>", 
			"\t\t\t<latitude>39.09627342605633</latitude>", "\t\t\t<altitude>0</altitude>", 
			"\t\t\t<heading>0.4933036572403619</heading>", "\t\t\t<tilt>4.320712180121981</tilt>", 
			"\t\t\t<range>171.8076656582859</range>", "\t\t\t<gx:altitudeMode>relativeToSeaFloor</gx:altitudeMode>", 
			"\t\t</LookAt>", "\t\t<styleUrl>#m_ylw-pushpin</styleUrl>", "\t\t<Point>", 
			"\t\t\t<coordinates>109.6312895215154,39.09636302006798,0</coordinates>", 
			"\t\t</Point>", "\t</Placemark>", "</Document>", "</kml>")
	
	result <- example[1:4]
	result[4] <- sprintf("/t<name>%s.kml</name>", filename)
	code <- names(which(sapply(points,is.character)))
	if(length(code)==0) code <- names(which(sapply(points,is.factor)))
    longitude <- names(points)[pmatch('lon',tolower(names(points)))]
    latitude <- names(points)[pmatch('lat',tolower(names(points)))]
    
	for (pt in 1:nrow(points)) 
		for (i in 5:48) 
			result = c(result, ifelse(i == 34, sprintf("/t/t<name>%s</name>", points[pt, code]), 
							ifelse(i == 36, sprintf("/t/t/t<longitude>%s</longitude>", points[pt, longitude]), 
									ifelse(i == 37, sprintf("/t/t/t<latitude>%s</latitude>", points[pt, latitude]), 
											ifelse(i == 46, sprintf("/t/t/t<coordinates>%s,%s,0</coordinates>", points[pt, longitude], points[pt, latitude]), 
													example[i])))))
	result = c(result, example[49:50])
	cat(result, file = (con <- file(sprintf("%s.kml", filename), "w", encoding = "UTF-8")))
	close(con)
}
