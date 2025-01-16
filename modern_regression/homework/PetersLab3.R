getwd()
setwd('Stat108 Code')
getwd()

library(ISLR2)
Auto = Auto
head(Auto)
attach(Auto)

Auto = Auto[,0:8]
head(Auto)

names(Auto)
pairs(Auto)

library(corrplot)
correlations = cor(Auto)
correlations
corrplot(correlations,"number")

lm.auto = lm(mpg~., data=Auto)
summary(lm.auto)

par(mfrow=c(2,2))
plot(lm.auto)
library(car)
vif(lm.auto)

plot(predict(lm.auto), rstudent(lm.auto))

lm.auto2 = lm(mpg~weight+origin+weight:origin)
summary(lm.auto2)
