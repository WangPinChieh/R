german<-read.csv(file="E:/R/german.csv", sep=",", header=TRUE)

# install.packages("party")
library(party)

library(rpart)
#data transformation

german$class <- as.factor(german$class)
ageFormula <- class ~ age
ageTree <- rpart(ageFormula, data=german.train.merge, method = "anova", control = rpart.control(minsplit = 6, cp = 0.001, maxdepth = 3))
plot(ageTree)
text(ageTree)
german <- within(german, {
  agecat <- NA
  agecat[age<21] <- "~21"
  agecat[age>=21 & age<25] <- "21~25"
  agecat[age>=25 & age<36] <- "25~36"
  agecat[age>=36 & age<37] <- "36~37"
  agecat[age>=37] <- "37~"
})

#end of data transformation


#preparing training and testing dataset
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

#end of preparing training and testing dataset


#building decition tree
myFormula <- class ~ checking_status+purpose+credit_amount+duration+savings_status+agecat

german_tree <- rpart(myFormula, data=german.train.merge, control = rpart.control(maxdepth = 5))

table(predict(german_tree))

printcp(german_tree)
plotcp(german_tree)
summary(german_tree)

testPred <- predict(german_ctree, newdata=german.test.merge)
table(testPred, german.test.merge$class)



