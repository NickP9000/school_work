#Support vector classifier 
rm(list = ls())

set.seed (1)
x <- matrix(rnorm (20 * 2), ncol = 2)
y <- c(rep(-1, 10), rep(1, 10))
x[y == 1, ] <- x[y == 1, ] + 1
plot(x, col = (3 - y))

# make a dataframe with the response coded as a factor to use svm()
dat <- data.frame(x = x, y = as.factor(y))

#install.packages("e1071")
library(e1071)
# This library does support vector classifier and SVM
svmfit <- svm(y ~ ., data = dat , kernel = "linear", cost = 5, scale = FALSE)
# scale = FALSE if you don't won't to standerdize the data

plot(svmfit , dat)

# The support vectors are crosses in R
#The remaining observations are circles

svmfit$index
# gives the index for the support vectors

summary(svmfit)
#gives basic information
# Seven support vectors
# cost = 10
# four in one class and 3 in the other

#Lets use a small cost

svmfit <- svm(y ~ ., data = dat , kernel = "linear",cost = 0.1, scale = FALSE)
plot(svmfit , dat)
#we obtained more support vectors because of the lower cost

svmfit$index

#We need to provide the range of cost values to figure out the width 
#of the margin.c(0.001 , 0.01, 0.1, 1, 5, 10, 100

set.seed (1)
tune.out <- tune(svm , y ~ ., data = dat , kernel = "linear",
                 ranges = list(cost = c(0.001 , 0.01, 0.1, 1, 5, 10, 100)))

#to find the cross-validation errors
summary(tune.out)

# We then look ar the lowest cost
bestmod <- tune.out$best.model
summary(bestmod)

#Create a testing dataset

xtest <- matrix(rnorm (20 * 2), ncol = 2)
ytest <- sample(c(-1, 1), 20, rep = TRUE)
xtest[ytest == 1, ] <- xtest[ytest == 1, ] + 1
testdat <- data.frame(x = xtest , y = as.factor(ytest))

#Predict the class labels of the datset through these test observations
ypred <- predict(bestmod , testdat)
table(predict = ypred , truth = testdat$y)

ypred <- predict(svmfit , testdat)
table(predict = ypred , truth = testdat$y)
# when we have a cost 5 it has
#          truth
# predict -1 1
#      -1  8 3
#       1   2 7

#we do this to seperate them more when plotting

x[y == 1, ] <- x[y == 1, ] + 0.5
plot(x, col = (y + 5) / 2, pch = 19)

# we use high cost for little misclassification of vectors
dat <- data.frame(x = x, y = as.factor(y))
svmfit <- svm(y ~ ., data = dat , kernel = "linear", cost = 1e5)
summary(svmfit)

#3 support vectors

plot(svmfit , dat)

# only 3 support vectors and no misclassifications (other color on the other 
# side)
# It is narrow so it would be bad on the test data

svmfit <- svm(y ~ ., data = dat , kernel = "linear", cost = 1)
summary(svmfit)

plot(svmfit , dat)

# Using cost 1, we misclassify a training observation.
# Also obtain a much larger margin 
# It seems that it will preform better than cost of 5 on the testing data

###################
#Support vector machine
set.seed (1)
x <- matrix(rnorm (200 * 2), ncol = 2)
x[1:100, ] <- x[1:100, ] + 2
x[101:150, ] = x[101:150, ] - 2
y <- c(rep(1, 150) , rep(2, 50))
dat <- data.frame(x = x, y = as.factor(y))
# Creating a data frame

plot(x, col = y)

train = sample (200 , 100)
svmfit = svm(y ~ ., data = dat[train,], kernel = "radial", gamma = 1, cost = 1)
plot(svmfit, dat[train,])
# how to make a SVM plot 

summary(svmfit)

svmfit = svm(y ~ ., data = dat[train , ], kernel = "radial",gamma = 1,
              cost = 1e5)
plot(svmfit, dat[train, ])

summary(svmfit)
# When increasing the cost to 10^5 you get wider margins but less 
# misclassification

set.seed (1)
tune.out = tune(svm , y ~ ., data = dat[train , ],kernel = "radial",
                ranges = list(cost = c(0.1 , 1, 10, 100, 1000) ,
                              gamma = c(0.5, 1, 2, 3, 4)))

summary(tune.out)
# Therefore the best choice of parameters is the second line or the one with
# cost = 1 and gamma = .5

table(true = dat[-train , "y"],pred = predict(tune.out$best.model, 
                                              newdata = dat[-train , ]))

# 12/100 = 12% of test observations are misclasified

#################################
#Clustering
#1 K-means clustering

set.seed (2)
x = matrix(rnorm (50 * 2), ncol = 2)
x[1:25, 1] = x[1:25, 1] + 3
x[1:25, 2] = x[1:25, 2] - 4


#we are going to decide that k=2 because we want two clusters
#if nstart >1 then K-means clustering will be performed using multiple random 
#assignments

km.out <- kmeans(x, 2, nstart = 20)

km.out$cluster

#par(mfrow = c(1, 2))
plot(x, col = (km.out$cluster + 1), 
     main = "K-Means Clustering Results with K = 2", xlab = "", ylab = "", 
     pch = 20, cex = 2)

# for real data we don't know how many clusters

set.seed (4)
km.out <- kmeans(x, 3, nstart = 20)
km.out

plot(x, col = (km.out$cluster + 1),
     main = "K-Means Clustering Results with K = 3",xlab = "", ylab = "",
     pch = 20, cex = 2)

set.seed (4)
km.out <- kmeans(x, 3, nstart = 1)
km.out$tot.withinss

km.out <- kmeans(x, 3, nstart = 20)
km.out$tot.withinss

# Less variation when you have a higher nstart number 

#2 Hierarchical clustering

hc.complete = hclust(dist(x),method="complete")
#single = smallest dissimilarities
#complete = largest dissimilarities
#average = record the average of these dissimilarities

hc.average = hclust(dist(x),method="average")
hc.single = hclust(dist(x),method="single")

par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage",xlab="",sub="",cex=.9)
plot(hc.average,main="Average Linkage",xlab="",sub="",cex=.9)
plot(hc.single,main="Single Linkage",xlab="",sub="",cex=.9)

#to determine cluster labels, use cutree()

cutree(hc.complete,2)
cutree(hc.average,2)
cutree(hc.single,2)

#Complete and average linkage generally separate observations into their
#correct group. However, single linkage identifies one point as beloning to its own cluster

cutree(hc.single,4)
#much more reasonable tree, but still two singletons

par(mfrow=c(1,1))
xsc = scale(x)
plot(hclust(dist(xsc),method="complete"),
  main="Hierarchical Clustering with Scaled Features")

#Correlation-based distance can be computed using the as.dist() function.
#only makes sense for data with at least three features since the absolute
#correlation between two observations with measurements on two features is always 1

x = matrix(rnorm(30*3),ncol=3)
dd = as.dist(1-cor(t(x)))
plot(hclust(dd,method="complete"),
     main="Complete Linkage with Correlation-Based Distance",
     xlab="",ylab="")
