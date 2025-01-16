#6.1

#1
library(ISLR2)
head(Credit)
?Credit

#2
attach(Credit)
library(leaps)

#regsubsets() function performs best sub selection by identiftig the best
#model that contains a given number of predictors, where best is 
#quantified using RSS.

regfit.full = regsubsets(Balance~.,data=Credit)#by default 8 variables
reg.summary.full = summary(regfit.full)

regfit.full = regsubsets(Balance~.,data=Credit,nvmax=11)#include all variables
reg.summary.full = summary(regfit.full)

#An asterisk indicates that a given variable is includied in the 
#corresponding model

names(reg.summary.full)

reg.summary.full$rsq
#Adjusted R^2 statistic increases from 74% to almost 95%

reg.summary.full$rss
#RSS decreases

par(mfrow=c(1,2))
plot(reg.summary.full$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary.full$rsq,xlab="Number of Variables",ylab="RSQ",type="l")

#RSS decreases and R^2 increases monotonically, as the number of features
#included in the models increases, however, from the three-variable model on,
#there is little improvement in RSS and R^2 as a result of including
#additional predictors

#6.2
regfit.fwd = regsubsets(Balance~.,data=Credit,nvmax=11,method="forward")
reg.summary.fwd = summary(regfit.fwd)

reg.summary.fwd$rsq
reg.summary.fwd$rss

par(mfrow=c(1,2))
plot(reg.summary.fwd$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary.fwd$rsq,xlab="Number of Variables",ylab="RSQ",type="l")

#6.3
regfit.bwd = regsubsets(Balance~.,data=Credit,nvmax=11,method="backward")
reg.summary.bwd = summary(regfit.bwd)

reg.summary.bwd$rsq
reg.summary.bwd$rss

par(mfrow=c(1,2))
plot(reg.summary.bwd$rss,xlab="Number of Variables",ylab="RSS",type="l")
plot(reg.summary.bwd$rsq,xlab="Number of Variables",ylab="RSQ",type="l")


#6.4

#1
dim(Credit)
head(Credit)

#2
regfit.full = regsubsets(Balance~.,data=Credit,nvmax=11)
reg.summary.full = summary(regfit.full)

reg.summary.full$cp
which.min(reg.summary$cp)

coef(regfit.full, 6)

#The regsubsets() function has a built-in plot() command which can be used
# to display the selected variables for the best model with a given
# number of predictors
?plot.regsubsets

plot(regfit.full, scal = "Cp")
#The top row of the plot contains a black square for each vairable selected
# according to the opimal model associated with that Cp statistic

reg.summary.full$bic
which.min(reg.summary.full$bic)

coef(regfit.full, 4)
plot(regfit.full, scale="bic")

reg.summary.full$adjr2
which.max(reg.summary.full$adjr2)

coef(regfit.full,7)
plot(regfit.full,scal="adjr2")

#6.5
regfit.full = regsubsets(Balance~.,data=Credit,nvmax=11,method="forward")
reg.summary.full = summary(regfit.full)

reg.summary.full$cp
which.min(reg.summary$cp)

coef(regfit.full, 6)
plot(regfit.full, scal = "Cp")

reg.summary.full$bic
which.min(reg.summary.full$bic)

coef(regfit.full, 5)
plot(regfit.full, scale="bic")

reg.summary.full$adjr2
which.max(reg.summary.full$adjr2)

coef(regfit.full,7)
plot(regfit.full,scal="adjr2")

#backward
regfit.full = regsubsets(Balance~.,data=Credit,nvmax=11,method="backward")
reg.summary.full = summary(regfit.full)

reg.summary.full$cp
which.min(reg.summary$cp)

coef(regfit.full, 6)
plot(regfit.full, scal = "Cp")

reg.summary.full$bic
which.min(reg.summary.full$bic)

coef(regfit.full, 4)
plot(regfit.full, scale="bic")

reg.summary.full$adjr2
which.max(reg.summary.full$adjr2)

coef(regfit.full,7)
plot(regfit.full,scal="adjr2")

#6.6
rm(list=ls())

#2
set.seed(1)
train = sample(c(T,F),nrow(Credit),replace=T)
#observation is in the training set, F otherwise

test = !train

#apply regsubsets() to the training set
regfit.vs = regsubsets(Balance~.,data=Credit[train,],nvmax=11)

#building an "X" matrix from data
test.mat = model.matrix(Balance~.,data=Credit[test,])

val.errors = rep(NA,11)
for (i in 1:11){
  coefi = coef(regfit.vs,id=i)#coefficients
  pred = test.mat[,names(coefi)]%%coefi #multiplying coefficients with data
  val.errors[i] = mean((Balance[test] - pred)^2)#calculating MSE
}

val.errors

which.min(val.errors)

coef(regfit.vs,7)

#finally, we perform best subset selection on the full data set, and select
# the best seven-variable model

#we make use of the full data set in order to obtain more
#accurate coefficient estimates
regfit.best = regsubsets(Balance~.,data=Credit,nvmax=7)
coef(regfit.best,7)

#######
#first we create a vector that allocates each observation to one of k = 10
#folds
k = 10
n = nrow(Credit)
set.seed(1)
folds = sample(rep(1:k,length=n))
#and we create a matrix in which we will store the results
cv.errors = matrix(NA,k,11,dimnames=list(NULL,paste(1:11)))

for (j in 1:k){
  regfit.cv = regsubsets(Balance~.,data=Credit[folds!=j,],nvmax=11)
  for(i in 1:11){
    pred = predict(regfit.cv,Credit[folds==j,],id=i)
    cv.errors[j,i] = mean((Credit$Balance[folds==j]-pred)^2)
  }
}

