german<-read.csv(file="E:/R/german.csv", sep=",", header=TRUE)


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
str(german)
dim(german)
var(german$age)
hist(german$age)
plot(density(german$age))
table(german$job)
pie(table(german$job))
cor(german$age, german$class)
aggregate(german$purpose ~ class, summary, data=german)
aggregate(german$class ~ german$purpose,  summary, data=german)
??aggregate
# apply practices
m <- matrix(c(1:3), nrow=1, ncol=3)

apply(matrix(c(1:3), nrow=1, ncol=3), 2, function(x) x^2)
sapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
lapply(matrix(c(1:3), nrow=1, ncol=3), function(x) x^2)
# end of apply practices

# install.packages("ggplot2")
library(ggplot2)
qplot(german$age, german$employment, data=german, facets = class ~.)


# install.packages("party")
library(party)
str(german)

table(german$class)

myFormula <- class ~ .

german.1 <- german[german$class == 1,]
german.2 <- german[german$class == 2,]


german.train.1 <- german.1[sample(nrow(german.1), 490),]
german.train.2 <- german.2[sample(nrow(german.2), 210),]
german.test.1 <- german.1[!(german.1$ID %in% german.train.1$ID),]
german.test.2 <- german.2[!(german.2$ID %in% german.train.2$ID),]

table(german.train.1$class)
table(german.train.2$class)

table(german.test.1$class)
table(german.test.2$class)


german.train.merge <- rbind(german.train.1, german.train.2)
german.test.merge <- rbind(german.test.1, german.test.2)

table(german.train.merge$class)
table(german.test.merge$class)

myFormula <- class ~ .

german_ctree <- ctree(myFormula, data=german.train.merge)

table(predict(german_ctree), german.train.merge$class)

print(german_ctree)
plot(german_ctree, type="simple")


testPred <- predict(german_ctree, newdata=german.test.merge)
table(testPred, german.test.merge$class)


