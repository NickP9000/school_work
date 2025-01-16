#a
library(ISLR2)
dim(OJ)
# 1070 rows 18 cols
head(OJ)
attach(OJ)
names(OJ)

#b
set.seed(1)
train = sample(1:nrow(OJ),800)
test = OJ[-train,]

#c
library(e1071)
svcfit = svm(Purchase~.,data=OJ,kernel="linear",cost=0.01,scale=FALSE,subset=train)
summary(svcfit)

#d
tune.out = tune(svm,Purchase~.,data=OJ[train,],kernel="linear",ranges=list(cost=c(0.01,.1,1,2.5,7.5)))
summary(tune.out)
#best model has cost of 7.5 and an error rate of 0.17125
svmfit = svm(Purchase~.,data=OJ[train,],gamma=1,cost=7.5,kernel="linear")
summary(svmfit)

#e
svmfit = svm(Purchase~.,data=OJ[train,],kernel="radial",gamma=1,cost=.01)
summary(svmfit)
tune.out = tune(svm,Purchase~.,data=OJ[train,],kernel="radial",ranges=list(cost=c(0.01,.1,1,2.5,7.5),gamma=1))
summary(tune.out)
# The best error is .21125 with the cost of 1 and gamma of 1
svmfit = svm(Purchase~.,data=OJ[train,],kernel="radial",gamma=1,cost=1)
summary(svmfit)
# It seemed that kernel radial had higher dispersion and error overall than not
# using kernel radial but if that was the goal of your data then kernal would
# be better than not using it

#f
library(ISLR2)
dim(USArrests)
#50 rows, 4 cols
head(USArrests)
attach(USArrests)

#g
hc.complete = hclust(dist(USArrests),method="complete")
plot(hc.complete)

#h
cutree(hc.complete,3)

#i
xsc = scale(USArrests)
hc.complete.scale = hclust(dist(xsc), method = "complete")
plot(hc.complete.scale)

#j
# when you scale the cluster it changes where the clusters are and the states 
# associated together. This also evens out the clusters from being very one 
# sided with the data.
