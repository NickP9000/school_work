#change working directory
getwd()
setwd("~/Stat108 Code")

#load ISLR2
library(ISLR2)

#check dataset
head(Boston)

?Boston
nrow(Boston)
ncol(Boston)
# 506 rows, 13 variables
dim(Boston)

#summary of crim
summary(Boston$crim)

#summary of chas
chas=as.factor(Boston$chas)
summary(chas)

plot(Boston$medv, Boston$rm)
