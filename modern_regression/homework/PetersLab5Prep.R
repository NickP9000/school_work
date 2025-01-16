library(ISLR2)
set.seed(1)
train = sample(392,196) #196 observations from 392 original observations

lm.fit =lm(mpg~horsepower,data=Auto,subset=train)

attach(Auto)
#MSE to validate the approach
mean((mpg-predict(lm.fit,Auto))[-train]^2) 

#use poly to estimate test error for quadtratic and cubic regressions
lm.fit2 = lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 = lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

set.seed(2)
train = sample (392 , 196)

lm.fit =lm(mpg~horsepower,data=Auto,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2) 

lm.fit2 = lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)

lm.fit3 = lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)

# glm and lm return same model when family is omitted from glm()
glm.fit = glm(mpg~horsepower,data=Auto)
coef(glm.fit)

lm.fit = lm(mpg~horsepower,data=Auto)
coef(lm.fit)

#LOOCV can be used using cv.glm() from the boot library
library(boot)
cv.err = cv.glm(Auto,glm.fit)
cv.err$delta

#validating with LOOCV with polynomials 1:10
cv.error = rep(0,10)
for (i in 1:10){
  glm.fit = glm(mpg~poly(horsepower,i),data=Auto)
  cv.error[i] = cv.glm(Auto,glm.fit)$delta[1]
}
cv.error

#use k-fold, k=10, instead of LOOCV
set.seed(17)
cv.error.10 = rep(0,10)
for (i in 1:10){
  glm.fit = glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit,K=10)$delta[1]
}
cv.error.10
