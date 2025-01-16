#a
library(ISLR2)
# 400 rows, 11 columns
dim(Carseats)
head(Carseats)

#b
attach(Carseats)
lm.mlr = glm(Sales~Income+Price+Advertising,data=Carseats)

#c
set.seed(1)
train = sample(400,320)
#need to retrain just on training set
lm.mlr = glm(Sales~Income+Price+Advertising,data=Carseats,subset=train)
mean((Sales-predict(lm.mlr,Carseats))[-train]^2)

#d
library(boot)
lm.mlr = glm(Sales~Income+Price+Advertising,data=Carseats)
cv.err = cv.glm(Carseats,lm.mlr)
cv.err$delta

#e
#we can use the same model again.
cv.err = cv.glm(Carseats,lm.mlr,K=10)
cv.err$delta

