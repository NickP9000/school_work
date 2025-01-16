library(MASS)
library(ISLR2)

head(Boston)
attach(Boston)

#linear regression model (y(response)~x(predictor))
lm.fit = lm(medv~lstat)
#get stats like p-value, beta1hat, beta0hat
summary(lm.fit)

#see what other information is stored in lm.fit
names(lm.fit)
#safest to extract info using functions like below
coef(lm.fit)

#confidence interval
confint(lm.fit)

#confidence interval (95%)
predict(lm.fit, data.frame(lstat=(c(5,10,15))), interval="confidence")
#prediction interval
predict (lm.fit, data.frame(lstat=(c(5,10,15))), interval="prediction")

#graph with least squares regression line
plot(lstat, medv)
abline(lm.fit)

abline(lm.fit, lwd=3)
abline(lm.fit, lwd=3, col='red')
#change shape of points
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20)

#view multiple plots at the same time
par(mfrow=c(2,2))
plot(lm.fit)

#compute residuals from linear regression fit
plot(predict(lm.fit), residuals(lm.fit))
# studentized residuals (residuals & plotted values)
plot(predict(lm.fit), rstudent(lm.fit))

#leverage stats computed with hatvalues()
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))
