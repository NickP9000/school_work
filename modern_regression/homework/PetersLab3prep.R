lm.fit = lm(medv~lstat+age, data=Boston)
summary(lm.fit)

#shorthand for all possible predictors
lm.fit = lm(medv~., data=Boston)
summary(lm.fit)

library(car)
vif(lm.fit)

lm.fit1 = lm(medv~.-age, data=Boston)
summary(lm.fit1)
#can also use the update function to adjust a previous linear model
lm.fit1 = update(lm.fit,~.-age)

summary(lm(medv~lstat*age,data=Boston))
attach(Boston)

library(ISLR2)
head(Carseats)
lm.fit = lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)

attach(Carseats)
#returns coding for dummy variables
contrasts(ShelveLoc)

#can make functions
LoadLibraries = function(){
  library(ISLR2)
  library(MASS)
  print("The libraries have been redacted.")
}

#tells whats in the function
LoadLibraries
#use function
LoadLibraries()
