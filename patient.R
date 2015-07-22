patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type2")
diabetes <- factor(diabetes)
status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, ordered = TRUE, levels = c("Poor","Improved","Excellent"))
patientdata <- data.frame(patientID, age, diabetes, status, row.names = patientID)

#Reading csv file through url
urlfile <- "http://ichart.yahoo.com/table.csv?s=2002.TW"
Stock2002TW <- read.csv(url(urlfile))
#End reading csv file through url