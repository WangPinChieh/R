german<-read.csv(file="D:/R/german.csv", sep=",", header=TRUE)


y <- factor(german$class)
x1 <- german$duration
x2 <- german$purpose
x3 <- german$savings_status
x4 <- german$age


lm.model <- glm(y ~ x2, data=german, family=binomial("logit"))

test <-german[c("class", "purpose")]
test$class <- as.factor(test$class)
test$purpose <- as.factor(test$purpose)


summary(test)





# apply practices
m <- matrix(c(1:3), nrow=1, ncol=3)

apply(matrix(c(1:3), nrow=1, ncol=3), 2, function(x) x^2)
sapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
lapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
# end of apply practices




