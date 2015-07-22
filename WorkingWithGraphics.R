
#plotting graphics to pdf[png, jpeg, bmp, tiff ..]
pdf("mygraph.pdf")

attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)

dev.off()
#end of plotting graphcis to pdf


dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)


plot(dose, drugA, type="b")


originalpar <- par(no.readonly = TRUE)
par(lty=2, pch=17)
plot(dose, drugA, type="b", col=mycolors)
par(originalpar)


mycolors <- rainbow(10)
pie(rep(1,10), labels = mycolors, col = mycolors)



