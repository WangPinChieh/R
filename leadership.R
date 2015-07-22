manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

# transformation of continuous variables to categorical variables
leadership <- within(leadership, {
  agecat <- NA
  agecat[age>75] <- "Elder"
  agecat[age>=55 && age<=75] <- "Middle Aged"
  agecat[age<55] <- "Young"
})
# end of transformation
leadership$age[age == 99] <- NA

# elimates any rows with missing data
newData <- na.omit(leadership)

newData





mydata<-data.frame(x1 = c(2, 2, 6, 4),
                   x2 = c(3, 4, 2, 8))

mydata <- transform(mydata, sumx = x1+x2, meanx=(x1+x2)/2)
mydata <- within(mydata, {
  mark <- NA
  mark[x1>1] <- 'A'
  mark[x1>3] <- 'B'
  mark[x1>5] <- 'C'
})
mydata
