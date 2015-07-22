patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type2")
diabetes <- factor(diabetes)
status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, ordered = TRUE, levels = c("Poor","Improved","Excellent"))
patientdata <- data.frame(patientID, age, diabetes, status, row.names = patientID)


patientdata$gender <- factor(c("1","2","1","2"), levels = c("1","2"), labels = c("male","female"))

str(patientdata)
head(patientdata)