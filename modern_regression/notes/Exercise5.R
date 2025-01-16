library(ISLR2)
getwd()
setwd("~/Stat108 Code")
getwd()

dim(Auto)
#392 rows, 9 cols
head(Auto)
attach(Auto)

lm.fit = lm(mpg~horsepower)
summary(lm.fit)
#There is a relationship between the predictor and the response

cor(horsepower, mpg)
#strong negative relationship

predict(lm.fit, data.frame(horsepower=100))
#~24.15139

predict(lm.fit, data.frame(horsepower=100), interval="confidence")
#lwr      upr
#23.66096 24.641

plot(horsepower,mpg)
abline(lm.fit, col="blue")
