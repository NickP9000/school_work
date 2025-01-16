########## 8.3.1
library(tree)
library(ISLR2)
attach(Carseats)
#create a binary variable from Sales.
#High is "Yes" when Sales exceeds 8 
High = factor(ifelse(Sales<=8,"No","Yes"))

#put the binary variable in the data set
Carseats = data.frame(Carseats,High)

#create a tree which uses our binary variable
#as the response and everything else except
#sales as the predictors
tree.carseats = tree(High~.-Sales,Carseats)

summary(tree.carseats)
#9% training error rate

#plot the tree and show the split text
plot(tree.carseats)
text(tree.carseats,pretty=0)

#prints out the tree in pure text format
tree.carseats

#make a tree and test its accuracy
set.seed(2)
train = sample(1:nrow(Carseats),200)
Carseats.test = Carseats[-train,]
High.test = High[-train]
tree.carseats = tree(High~.-Sales,Carseats,subset=train)
tree.pred = predict(tree.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
(104+50)/length(High.test)
#77% accuracy

#perform cross validation with cv.tree to find
#optimal complexity
set.seed(7)
cv.carseats = cv.tree(tree.carseats,FUN=prune.misclass)
names(cv.carseats)
cv.carseats

par(mfrow=c(1,2))
plot(cv.carseats$size,cv.carseats$dev,type="b")
plot(cv.carseats$k,cv.carseats$dev,type="b")
#tree with 9 nodes is shown to result in the lowest amount of errors

#obtain the nine-node tree
prune.carseats = prune.misclass(tree.carseats,best=9)
plot(prune.carseats)
text(prune.carseats,pretty=0)

tree.pred = predict(prune.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
(97+58)/length(High.test)
#77.5% test error

prune.carseats = prune.misclass(tree.carseats,best=14)
plot(prune.carseats)
text(prune.carseats,pretty=0)
tree.pred = predict(prune.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
(102+52)/length(High.test)
#by increasing best, we get a larger tree with lower accuracy

#################### 8.3.2
attach(Boston)
#make a tree from the Boston data set
set.seed(1)
train = sample(1:nrow(Boston),nrow(Boston)/2)
tree.boston = tree(medv~.,Boston,subset=train)
summary(tree.boston)

#plot tree
plot(tree.boston)
text(tree.boston,pretty=0)

#check if we can improve tree by pruning
cv.boston = cv.tree(tree.boston)
plot(cv.boston$size,cv.boston$dev,type="b")

prune.boston = prune.tree(tree.boston,best=5)
plot(prune.boston)
text(prune.boston,pretty=0)

yhat = predict(tree.boston,newdata=Boston[-train,])
boston.test = Boston[-train,"medv"]
plot(yhat,boston.test)
abline(0,1)
mean((yhat-boston.test)^2)
#MSE of 35.29

####### 8.3.3
library(randomForest)
#make a bagging model on the boston data
#bagging is when m=p (all predictors are considered)
set.seed(1)
bag.boston = randomForest(medv~.,data=Boston,subset=train,mtry=12,importance=T)
bag.boston

yhat.bag = predict(bag.boston,newdata=Boston[-train,])
plot(yhat.bag,boston.test)
abline(0,1)
mean((yhat.bag-boston.test)^2)
#MSE of 23.42
#better than our optimally pruned tree

#change number of trees in the model with ntree
bag.boston = randomForest(medv~.,data=Boston,subset=train,mtry=12,ntree=25)
yhat.bag = predict(bag.boston,newdata=Boston[-train,])
mean((yhat.bag-boston.test)^2)
#MSE of 25.27

set.seed(1)
rf.boston = randomForest(medv~.,data=Boston,subset=train,mtry=6,important=T)
yhat.rf = predict(rf.boston,newdata=Boston[-train,])
mean((yhat.rf-boston.test)^2)
#MSE of 20.21
#random forests yields a better result over bagging in this case

#view the importance of each variable
importance(rf.boston)

#important plot of the variables in the model
varImpPlot(rf.boston)
