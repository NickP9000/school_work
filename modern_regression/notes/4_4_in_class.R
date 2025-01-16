library(glmnet)
library(ISLR2)
dim(Credit)
head(Credit)

attach(Credit)

x = model.matrix(Balance ~ ., Credit)[, -1] #A matrix corresponding to the predictors.  model.matrix() also
#automatically transforms any qualitative variables into dummy variables (if any).
#-1 to avoid the intercept

y = Balance #A vector

#1
ridge.mod = glmnet(x, y, alpha = 0) # alpha=0 ridge regression
#glmnet() function performs ridge regression for an automatically
#selected range of λ values.

dim(coef(ridge.mod))
#12×100 matrix, with 12 rows (one for each predictor, plus an intercept) and 100
#columns (one for each value of λ).

#2
ridge.mod$lambda[5]
#These are the coefficients when λ = 273335:
coef(ridge.mod)[,5]

#Their l2 norm: remove beta0
sqrt(sum(coef(ridge.mod)[-1,5]^2))

#3
ridge.mod$lambda[95]
#These are the coefficients when λ = 63:
coef(ridge.mod)[,95]

#Their l2 norm:
sqrt(sum(coef(ridge.mod)[-1,95]^2))

#The coefficient estimates to be much smaller, in terms of l2 norm, when a large value of λ is used,
#as compared to when a small value of λ is used.

#4
#The ridge regression coefficients for a new value of λ, say 50:
predict(ridge.mod , s = 50, type = "coefficients")

############################ Ex 6.9
#1
x <- model.matrix(Balance ~ ., Credit)[, -1] 
y <- Balance 

#ranging from λ = 10^10 to λ = 10^−2,
grid <- 10^seq(10, -2, length = 100)
ridge.mod <- glmnet(x, y, alpha = 0, lambda = grid) 

#Associated with each value of λ is a vector of ridge regression coefficients,
#stored in a matrix that can be accessed by coef().
dim(coef(ridge.mod))

#2
ridge.mod$lambda[50]
#These are the coefficients when λ = 11498:
coef(ridge.mod)[,50]

#Their l2 norm:
sqrt(sum(coef(ridge.mod)[-1,50]^2))

#3
ridge.mod$lambda[60]
#These are the coefficients when λ = 705:
coef(ridge.mod)[,60]

#Their l2 norm:
sqrt(sum(coef(ridge.mod)[-1,60]^2))

############################ Ex 6.10
#1
x = model.matrix(Balance ~ ., Credit)[, -1] 
y = Balance 
grid = 10^seq(10, -2, length = 100)

set.seed (1)
train = sample (1: nrow(x), nrow(x) / 2)
test = (-train)
y.test = y[test]


#2
ridge.mod = glmnet(x[train, ], y[train], alpha = 0, lambda = grid, thresh = 1e-12) #Smaller threshold. 
#Defaults value is 1e-7.

#3
#By default, the function cv.glmnet()
#performs 10-fold cross-validation. This can change using nfolds.

set.seed (1)
cv.ridge = cv.glmnet(x[train,], y[train], alpha = 0)

plot(cv.ridge)

bestlam = cv.ridge$lambda.min
bestlam

#Therefore, we see that the value of λ that results in the smallest cross-validation
#error is 41.60385.

ridge.pred = predict(ridge.mod , s = bestlam , newx = x[test, ])
mean (( ridge.pred - y.test)^2) #MSE
#16111.46

#4
#coefficients of RR model with best choosen lambda
ridge.out = glmnet(x, y, alpha = 0)
predict(ridge.out , type = "coefficients", s = bestlam)

#NO VARIABLE SELECTION


############################ Ex 6.11
#1

library(ISLR2)
names(Hitters)

#remove missing values
dim(Hitters)
sum(is.na(Hitters))
Hitters = na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

attach(Hitters)

x = model.matrix(Salary ~ ., Hitters)[, -1] 
y = Salary 

grid = 10^seq(10, -2, length = 100)

set.seed (1)
train = sample (1: nrow(x), nrow(x) / 2) # /2 rounds down
test = (-train)
y.test = y[test]

#2
#alpha=1 for the Lasso
lasso.mod = glmnet(x[train, ], y[train], alpha = 1, lambda = grid)
plot(lasso.mod)

#3
#By default, the function cv.glmnet()
#performs 10-fold cross-validation. This can change using nfolds.

set.seed (1)
cv.lasso = cv.glmnet(x[train,], y[train], alpha = 1) #alpha=1 for the Lasso

plot(cv.lasso)

bestlam = cv.lasso$lambda.min
bestlam

#Therefore, we see that the value of λ that results in the smallest cross-validation
#error is  9.286955.

lasso.pred = predict(lasso.mod , s = bestlam , newx = x[test , ])
mean (( lasso.pred - y.test)^2)
#test MSE is 143673.6

#4
#coefficients of the lasso model with best chosen lambda
lasso.out = glmnet(x, y, alpha = 1)
lasso.coef = predict(lasso.out , type = "coefficients", s = bestlam)[1:20, ]
lasso.coef

#Here we see that 8 of the 19 coefficient estimates are exactly zero. 
#So the lasso model with λ chosen by cross-validation contains only 11 variables.

#end of 4/4 class

############################ Ex 6.12
#1

library(ISLR2)
names(Hitters)

#remove missing values
dim(Hitters)
sum(is.na(Hitters))
Hitters <- na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

attach(Hitters)

x <- model.matrix(Salary ~ ., Hitters)[, -1] 
y <- Salary 

grid <- 10^seq(10, -2, length = 100)

set.seed (1)
train <- sample (1: nrow(x), nrow(x) / 2)
test <- (-train)
y.test <- y[test]

#2
#Ridge as initial
set.seed (1)
cv.ridge <- cv.glmnet(x[train,], y[train], alpha = 0) #alpha = 0 for ridge
bestlam.ridge <- cv.ridge$lambda.min
bestlam.ridge

#weight with gamma=1
w <- 1/abs(matrix(coef(cv.ridge, s=bestlam.ridge)[, 1][2:(ncol(x)+1)]))^1

#3
#Adaptive lasso
#alpha=1 and penalty.factor=w for the adaptive lasso
adp.lasso.mod <- glmnet(x[train, ], y[train], alpha = 1, lambda = grid, penalty.factor=w)
plot(adp.lasso.mod)

#4
set.seed (1)
#alpha=1 and penalty.factor=w for the adaptive lasso
cv.adp.lasso <- cv.glmnet(x[train,], y[train], alpha = 1, penalty.factor=w) 
plot(cv.adp.lasso)

bestlam.adp.lasso <- cv.adp.lasso$lambda.min
bestlam.adp.lasso

adp.lasso.pred <- predict(adp.lasso.mod, s = bestlam.adp.lasso , newx = x[test , ])
mean (( adp.lasso.pred - y.test)^2)
#158395.6

#5
#coefficients of the adaptive lasso model with best chosen lambda
adp.lasso.out <- glmnet(x, y, alpha = 1, penalty.factor=w)
adp.lasso.coef<-predict(adp.lasso.out , type = "coefficients", s = bestlam.adp.lasso)[1:20, ]
adp.lasso.coef

#Here we see that 10 of the 19 coefficient estimates are exactly zero. 
#So the adaptive lasso model with λ chosen by cross-validation contains only 9 variables.

