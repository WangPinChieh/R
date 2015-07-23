german<-read.csv(file="D:/R/german.csv", sep=",", header=TRUE)

head(german)

newData <- na.omit(german)

y <- factor(newData$class)
x1 <- newData$duration
x2 <- newData$purpose
x3 <- newData$savings_status
x4 <- newData$age


lm.model <- glm(y ~ x2, data=german, family=binomial("logit"))

test <-newData[c("class", "purpose")]
test$class <- as.factor(test$class)
test$purpose <- as.factor(test$purpose)

within(test, {
  purpose[purpose=="X"] <- NA
  purpose[purpose==""] <- NA
})
test<- na.omit(test)

summary(test)

# apply practices
m <- matrix(c(1:3), nrow=1, ncol=3)

apply(matrix(c(1:3), nrow=1, ncol=3), 2, function(x) x^2)
sapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
lapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
# end of apply practices




