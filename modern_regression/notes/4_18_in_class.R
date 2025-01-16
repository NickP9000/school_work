# svm() for a support vector classifier when the arg kernel = "linear"
# cost arg allows us to specify the cost of a violation to the margin
# larger cost = narrower margins and few suport vectors on the margin

set.seed(1)
x = matrix(rnorm(20*2),ncol=2)
y = c(rep(-1,10),rep(1,10))
x[y==1,] = x[y==1,]+1
plot(x,col=(3-y))

#the classes are not linearly separable

dat =  data.frame(x=x,y=as.factor(y))

library(e1071)
svmfit = svm(y~.,data=dat,kernel="linear",cost=10,scale=F)
# scale=F tells the function to not scale each feature to have
# mean zero or standard deviation one

plot(svmfit,dat)

# The plot clearly displays the regions of the feature space that
# the svm model assigns classes to. -1 is yellow, 1 is red.

# Support vectors are plotted as an "x"
# 7 support vectors

#determine identities of support vectors
svmfit$index

summary(svmfit)
#cost=10
#seven support vectors: four in one class, three in the other

svmfit = svm(y~.,data=dat,kernel="linear",cost=0.1,scale=F)
plot(svmfit,dat)

summary(svmfit)
#16 support vectors: 8 in each class

svmfit$index

#use tune to perform 10-cross-validation on a set model of interest
#need to provide a range of cost values

set.seed(1)
tune.out = tune(svm,y~.,data=dat,kernel="linear",
                ranges=list(cost=c(0.001,0.01,1,5,10,100)))

summary(tune.out)

bestmod = tune.out$best.model
summary(bestmod)

xtest = matrix(rnorm (20 * 2), ncol = 2)
ytest = sample(c(-1, 1), 20, rep = TRUE)
xtest[ytest == 1, ] = xtest[ytest == 1, ] + 1
testdat = data.frame(x = xtest , y = as.factor(ytest))

ypred = predict(bestmod, testdat)
table(predict=ypred,trust=testdat$y)

(9+8)/20
#85% correct classifications

#what if we had instead used cost = 5? (Homework)

x[y==1,] = x[y==1,]+0.5
plot(x,col=(y+5)/2,pch=19)

dat = data.frame(x = x, y = as.factor(y))
svmfit = svm(y ~ ., data = dat , kernel = "linear", cost = 1e5)
summary(svmfit)
plot(svmfit,dat)

# 3 support vectors, no misclassifications

svmfit = svm(y ~ ., data = dat , kernel = "linear", cost = 1)
summary(svmfit)
plot(svmfit,dat)

#cost=1  misclassifies a single training observation, but it is likely
#to perform better on a testing set based on its wider margins.

#test