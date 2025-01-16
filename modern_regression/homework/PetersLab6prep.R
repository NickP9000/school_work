#6.5.1
#explore dataset
library(ISLR2)
#View(Hitters)
names(Hitters)
dim(Hitters)
sum(is.na(Hitters$Salary))

#omit na values
Hitters = na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

#regsubsets() for best subset selection (uses RSS)
library(leaps)
regfit.full = regsubsets(Salary~.,Hitters)
summary(regfit.full)

#default # of variables is 8, so we need to adjust with nvmax
regfit.full = regsubsets(Salary~.,data=Hitters,nvmax=19)
reg.summary = summary(regfit.full)

names(reg.summary)

#r^2 increases from 32% to almost 55%
reg.summary$rsq

#plotting will help us decide which model to pick
#type changes how/if lines and points are displayed
par(mfrow=c(2,2))
plot(reg.summary$rss,xlab="Number of Variables",ylab="RSS",type="o")
plot(reg.summary$adjr,xlab="Number of Variables",ylab="AdjustedRSq",type="b")

#use points() to visualize the best model on the plot
which.max(reg.summary$adjr2)
points(11, reg.summary$adjr2[11],col="red",cex=2,pch=20)

#cp and bic can also be plotted
plot(reg.summary$cp,xlab="Number pf Variables",ylab="Cp",type="o")
which.min(reg.summary$cp)
points(10,reg.summary$cp[10],col="red",cex=2,pch=20)
which.min(reg.summary$bic)
plot(reg.summary$bic,xlab="Number of Variables",ylab="BIC",type="o")
points(6,reg.summary$bic[6],col="red",cex=2,pch=20)

#regsubsets() comes with a built-in plot
plot(regfit.full, scale="r2")
plot(regfit.full, scale="adjr2")
plot(regfit.full, scale="Cp")
plot(regfit.full, scale="bic")

#use coef to see the coefficient estimates associated with the model
coef(regfit.full,6)

#we can change the method to forward or backward selection
regfit.fwd = regsubsets(Salary~.,data=Hitters,nvmax=19,method="forward")
summary(regfit.fwd)
regfit.bwd = regsubsets(Salary~.,data=Hitters,nvmax=19,method="backward")
summary(regfit.bwd)

#The different models identify different best models with 7 variables
coef(regfit.full,7)
coef(regfit.fwd,7)
coef(regfit.bwd,7)

set.seed(1)
train = sample(c(TRUE,FALSE),nrow(Hitters),replace=TRUE)
test = (!train)

#regsubsets does not have a built-in subset feature
regfit.best = regsubsets(Salary~.,data=Hitters[train,],nvmax=19)

test.mat = model.matrix(Salary~.,data=Hitters[test,])

#computes the MSE of a model with i of variables
val.errors = rep(NA,19)
for(i in 1:19){
  coefi = coef(regfit.best,id=i)
  pred = test.mat[,names(coefi)]%*%coefi
  val.errors[i] = mean((Hitters$Salary[test]-pred)^2)
}

#best model is the one with  7 variables
val.errors
which.min(val.errors)
coef(regfit.best,7)

#make our own predict function from the code above
#no native predict function for regsubsets
predict.regsubsets = function(object,newdata,id,...){
  form = as.formula(object$call[[2]])
  mat = model.matrix(form,newdata)
  coefi = coef(object,id=id)
  xvars = names(coefi)
  mat[,xvars]%*%coefi
}

#use full data set to obtain most accurate coefficient estimates
regfit.best = regsubsets(Salary~.,data=Hitters,nvmax=19)
#we can see that the best 7 variables model with the full
#data set even has different variables
coef(regfit.best,7)

#use 10-fold cross-validation to try to choose the best model
k = 10
n = nrow(Hitters)
set.seed(1)
folds = sample(rep(1:k,length=n))
cv.errors = matrix(NA,k,19,dimnames=list(NULL,paste(1:19)))

#loop that performs cross-validations
#store them in cv.errors
for(j in 1:k){
  best.fit = regsubsets (Salary~.,data=Hitters[folds!=j,],nvmax=19)
  for(i in 1:19){
    #use our predict method to make 
    pred = predict(best.fit,Hitters[folds==j,],id=i)
    cv.errors[j,i] = mean((Hitters$Salary[folds==j]-pred)^2)
    }
}

#use apply() to get the mean over the columns of the matrix
mean.cv.errors = apply(cv.errors,2,mean)
mean.cv.errors
#shows that the model with the least error is the one with 10 variables
par(mfrow=c(1,1))
plot(mean.cv.errors,type="o")

#use best subset selection on whole data set to get model with 10 variables
reg.best = regsubsets(Salary~.,data=Hitters,nvmax=19)
coef(reg.best,10)

#6.5.2 -------------------------------------------------------

library(ISLR2)
#View(Hitters)
names(Hitters)
dim(Hitters)
sum(is.na(Hitters$Salary))

#omit na values
Hitters = na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

#make x and y for ridge regression and lasso
#model.matrix transforms qualitative variables to dummy variables
#[,-1] to take out the intercept (neither equation use it)
x = model.matrix(Salary~.,data=Hitters)[,-1]
y = Hitters$Salary

library(glmnet)
grid = 10^seq(10,-2,length=100)
#alpha=0 for ridge regression
ridge.mod = glmnet(x,y,alpha=0,lambda=grid)
#glmnet automatically standardizes. Use standardize=FALSE to turn off

dim(coef(ridge.mod))

#coefficients when lambda=11498
ridge.mod$lambda[50]
coef(ridge.mod)[,50]
#l2 norm = ~6
sqrt(sum(coef(ridge.mod)[-1,50]^2))

#coefficients when lambda=705
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
#much larger l2 norm of ~58
sqrt(sum(coef(ridge.mod)[-1,60]^2))

#we can obtain ridge regression coefficients for a new value of lambda
predict(ridge.mod,s=50,type="coefficients")[1:20,]

#get train/test split so we can estimate test error
set.seed(1)
train = sample(1:nrow(x),nrow(x)/2)
test = (-train)
y.test = y[test]

#apply ridge regression on the train set and evaluate with MSE on test set
ridge.mod = glmnet(x[train,],y[train],alpha=0,lambda=grid,thresh=1e-12)
#get test error with newx argument
ridge.pred = predict(ridge.mod,s=4,newx=x[test,])
mean((ridge.pred-y.test)^2)

#when only have the intercept, we predict just by the mean
#it has a much higher MSE
mean((mean(y[train])-y.test)^2)

#get the same result by fitting with a large 
ridge.pred = predict(ridge.mod,s=1e10,newx=x[test,])
mean((ridge.pred-y.test)^2)

#compare a ridge regression model with lambda=4 to a least square regression model
ridge.pred = predict(ridge.mod,s=0,newx=x[test,],exact=T,x=x[train,],y=y[train])
mean((ridge.pred-y.test)^2)
lm(y~x,subset=train)
predict(ridge.mod,s=0,exact=T,type="coefficients",x=x[train,],y=y[train])[1:20,]

#we can tune lambda with cv.glmnet(), 10-fold by default
set.seed(1)
cv.out = cv.glmnet(x[train,],y[train],alpha=0)
plot(cv.out)
bestlam = cv.out$lambda.min
bestlam
#326
#value of lambda in the smallest cross-validation error

#improvement from model with lambda=4
ridge.pred = predict(ridge.mod,s=bestlam,newx=x[test,])
mean((ridge.pred-y.test)^2)

#refit on whole data set using our best lambda
out = glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:20,] 
#no coefficients are zero since ridge regression
#does not do ridge regression

#alpha = 1 for lasso model
lasso.mod = glmnet(x[train,],y[train],alpha=1,lambda=grid)
plot(lasso.mod)
#some variables are equal to zero as seen from the plot

set.seed(1)
cv.out = cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
bestlam = cv.out$lambda.min
lasso.pred = predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)
#similar MSE to the test MSE of the ridge regression model
#in which the lambda was chosen with cross-validation

#Lasso has an advantage since it only uses 11/19 variables
out = glmnet(x,y,alpha=1,lambda=grid)
lasso.coef = predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef
lasso.coef[lasso.coef!=0]
