#a
library(ISLR2)
dim(Carseats)
#400 rows 12 columns
head(Carseats)
attach(Carseats)

#b
set.seed(1)
train = sample(1:nrow(Carseats),nrow(Carseats)*0.8)
test = Carseats[-train,]
target.test = Sales[-train]

#c
library(tree)
tree.carseats = tree(Sales~.,data=Carseats,subset=train)
plot(tree.carseats)
text(tree.carseats,pretty=0)

#d
tree.pred = predict(tree.carseats,newdata=test)
mean((tree.pred-target.test)^2)
#MSE of ~4.94

#e
cv.carseats = cv.tree(tree.carseats)
plot(cv.carseats$size,cv.carseats$dev,type="b")
#best model is one with 16 nodes

#f
prune.carseats = prune.tree(tree.carseats,best=16)
plot(prune.carseats)
text(prune.carseats,pretty=0)

tree.pred = predict(prune.carseats,newdata=test)
mean((tree.pred-target.test)^2)
#MSE of ~4.94
#same model?

#g
library(randomForest)

rf.carseats = randomForest(Sales~.,data=Carseats,subset=train,mtry=4,importance=T)
tree.pred = predict(rf.carseats,newdata=test)
mean((tree.pred-target.test)^2)
#MSE of ~3.12

#h
importance(rf.carseats)
varImpPlot(rf.carseats)

#i
rf.carseats = randomForest(Sales~.,data=Carseats,subset=train,mtry=10,importance=T)
tree.pred = predict(rf.carseats,newdata=test)
mean((tree.pred-target.test)^2)
#MSE of ~2.93