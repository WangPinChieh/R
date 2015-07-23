patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type2")
diabetes <- factor(diabetes)
status <- c("Poor", "Poor", "Excellent", "Poor")
status <- factor(status, ordered = TRUE, levels = c("Poor","Excellent"))
patientdata <- data.frame(patientID, age, diabetes, status, row.names = patientID)

y <- patientdata$status
x1 <- patientdata$age
x2 <- patientdata$diabetes

ml.logit <- glm(y ~ x1 + x2, family = binomial("logit") ,data = patientdata)
summary(ml.logit)

newdata <- data.frame(x1 = c(30,28,40), x2 = factor(c("Type2","Type2","Type2")))

result <- predict(ml.logit, newdata)

result