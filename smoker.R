smokerData <- read.csv(file="smoker.csv", sep=",", header = T)

smoke <- table(smokerData$Smoke, smokerData$SES)

barplot(smoke, legend=T, beside=T, main='Smoking status by SES')
margin.table(smoke) # total number of data
margin.table(smoke,1) # total number of data summed by row
margin.table(smoke,2) #total number of data summed by column

smoke/margin.table(smoke)
# is equivalent to
prop.table(smoke)



expected <- as.array(margin.table(smoke,1)) %*% t(as.array(margin.table(smoke,2)))/margin.table(smoke)

chi <- sum((expected - as.array(smoke))^2/expected)
