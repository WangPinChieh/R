#Reading csv file through url
urlfile <- "http://ichart.yahoo.com/table.csv?s=2002.TW"
Stock2002TW <- read.csv(url(urlfile))
#End reading csv file through url