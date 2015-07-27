german<-read.csv(file="german.csv", sep=",", header=TRUE)

# install.packages("party")
library(party)
library(rpart)
# install.package("ROCR")
library(ROCR)


#---------------------------------------------------------------------
#preparing training and testing dataset
german.1 <- german[german$class == 1,]
german.2 <- german[german$class == 2,]


german.train.1 <- german.1[sample(nrow(german.1), 490),]
german.train.2 <- german.2[sample(nrow(german.2), 210),]
german.test.1 <- german.1[!(german.1$ID %in% german.train.1$ID),]
german.test.2 <- german.2[!(german.2$ID %in% german.train.2$ID),]

#table(german.train.1$class)
#table(german.train.2$class)

#table(german.test.1$class)
#table(german.test.2$class)


german.train.merge <- rbind(german.train.1, german.train.2)
german.test.merge <- rbind(german.test.1, german.test.2)

#table(german.train.merge$class)
#table(german.test.merge$class)

#end of preparing training and testing dataset
#---------------------------------------------------------------------

#data transformation

#data analysis - age
cor.test(german.train.merge$age, german.train.merge$class, method = "pearson")
ana_age <- table(german.train.merge$age, german.train.merge$class)
ana_age_frame <- as.data.frame.matrix(ana_age)
ana_age_frame <- within(ana_age_frame, {
  defaultProb <- NA
  defaultProb <- ana_age_frame$`2` / (ana_age_frame$`1` + ana_age_frame$`2`)
})

# sorting by defaultProb field (placing a minus sign before means sorting in descending)
ana_age_frame <- ana_age_frame[order(-ana_age_frame$defaultProb),]
#end of data analysis - age



#data analysis - duration
ana_duration <- table(german.train.merge$duration, german.train.merge$class)
ana_duration_frame <- as.data.frame.matrix(ana_duration)
ana_duration_frame <- within(ana_duration_frame, {
  defaultProb <- NA
  defaultProb <- ana_duration_frame$`2`/(ana_duration_frame$`1`+ana_duration_frame$`2`)
})



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

#---------------------------------------------------------------------


#building decition tree
myFormula <- class ~ checking_status+purpose+credit_amount+duration+savings_status+age
mySecondFormula <- class ~ .

german_tree <- rpart(myFormula, data=german.train.merge, control = rpart.control(maxdepth = 5))
german_tree2 <- rpart(mySecondFormula, data=german.train.merge, control = rpart.control(maxdepth = 5))
printcp(german_tree)
plotcp(german_tree)
summary(german_tree)

# display expected and predicted result
preds <- predict(german_tree, newdata = german.test.merge, type = "class")
preds2 <- predict(german_tree2, newdata = german.test.merge, type = "class")
table(german.test.merge$class,preds)
table(german.test.merge$class,preds2)
# end of display expected and predicted result



#---------------------------------------------------------------------

