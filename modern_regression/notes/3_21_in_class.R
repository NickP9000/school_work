#1
set.seed(2023)
x = rnorm(100)
y = 5.45*x + rnorm(100)

#2
plot(x,y)
#roughly linear pattern

data = data.frame(x,y)

#3
set.seed(1)
train = sample(100,80)

#4
glm.fit.vs = glm(y~x,data=data,subset=train)

#MSE to validate the approach
mean((y-predict(glm.fit.vs,data))[-train]^2)

#5
set.seed(2)
train = sample(100,80)
glm.fit.vs = glm(y~x,data=data,subset=train)
mean((y-predict(glm.fit.vs,data))[-train]^2)

set.seed(3)
train = sample(100,80)
glm.fit.vs = glm(y~x,data=data,subset=train)
mean((y-predict(glm.fit.vs,data))[-train]^2)

#5.2
rm(list=ls())
#1
set.seed(2023)
x = rnorm(100)
y = 5.45*x + rnorm(100)

data = data.frame(x,y)

#2
library(boot)
glm.fit = glm(y~x,data=data)
#leave one out cross validation (LOOCV)
cv.err = cv.glm(data,glm.fit)
cv.err$delta #see the vector of prediction error, first is raw, second is adjusted

#the two numbers are similar up to three decimals

#5.3

#1
set.seed(2023)
x = rnorm(100)
y = 5.45*x + rnorm(100)
data = data.frame(x,y)

#2
library(boot)
glm.fit = glm(y~x,data=data)

#five-fold cross-validation
cv.err5 = cv.glm(data,glm.fit,K=5)
cv.err5$delta

#ten-fold cross-validation
cv.err10 = cv.glm(data,glm.fit,K=10)
cv.err10$delta


#5.4

#1
library(ISLR2)
Default = Default
attach(Default)
names(Default)
dim(Default)
glm.fit = glm(default~income+balance,data=Default,family=binomial)

#2
set.seed(1)
train = sample(10000,8000)
test = Default[-train,]

test_data = default[-train]

lr.fit2 = glm(default~income+balance,family=binomial,data=Default,subset=train)

lr.prob2 = predict(lr.fit2,test,type="response")

lr_pred2 = rep("No", 2000)

lr_pred2[lr.prob2>.5] = "Yes"

table(lr_pred2,test_data)#confusion matrix

1-mean(lr_pred2==test_data) #2.6% error rate

#3 takes a long long time
cv.glm = cv.glm(Default,glm.fit)
cv.glm$delta

#4
cv.k5 = cv.glm(Default,glm.fit,K=5)
cv.k5$delta #2.14% error rate

#5
cv.k10 = cv.glm(Default,glm.fit,K=10)
cv.k10$delta #2.14% error rate
