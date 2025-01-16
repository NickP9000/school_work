#a
library(ISLR2)
head(College)
dim(College)
attach(College)
# 777 rows 18 cols

#b
set.seed(1)
train = sample(c(TRUE,FALSE),nrow(College),replace=TRUE)
test = (!train)

#c
lm.lr = lm(Apps~.,data=College,subset=train)
lm.pred = predict(lm.lr,newdata=College[test,],type="response")
mean((lm.pred-Apps[test])^2)

#d
library(glmnet)
x = model.matrix(Apps~.,data=College)[,-1]
y = College$Apps
y.test = y[test]

grid = 10^seq(10,-2,length=100)

ridge.mod = glmnet(x,y,alpha=0,lambda=grid)

set.seed(1)
cv.out = cv.glmnet(x[train,],y[train],alpha=0)
bestlam = cv.out$lambda.min
bestlam
#394

#test error
ridge.pred = predict(ridge.mod,s=bestlam,newx=x[test,])
mean((ridge.pred-y.test)^2)

#e
out = glmnet(x,y,alpha=0)
predict(out,type="coefficients",s=bestlam)[1:18,] 

#f
lasso.mod = glmnet(x[train,],y[train],alpha=1,lambda=grid)

set.seed(1)
cv.out = cv.glmnet(x[train,],y[train],alpha=1)
bestlam = cv.out$lambda.min
lasso.pred = predict(lasso.mod,s=bestlam,newx=x[test,])
mean((lasso.pred-y.test)^2)

#g
out = glmnet(x,y,alpha=1)
predict(out,type="coefficients",s=bestlam)[1:18,] 

