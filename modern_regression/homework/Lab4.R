library(ISLR2)

head(Auto)
Auto = Auto[,-9]
head(Auto)
attach(Auto)
dim(Auto)

mpg01 = rep(0,392)
mpg01[mpg > median(mpg)] = 1

#remove mpg
Auto2 = Auto[,-1]
Auto2 = data.frame(Auto2, mpg01)
head(Auto2)

library(corrplot)
correlation = cor(Auto2)
corrplot(correlation, method="pie")
glm.auto = glm(mpg01~.,data=Auto2,family=binomial)
summary(glm.auto)

dim(Auto2)
train = Auto2[1:314,]
test = Auto2[315:392,]
test_target = mpg01[315:392]

glm.train = glm(mpg01~year+weight+horsepower,data=train,family=binomial)
glm.test = predict(glm.train,test,type="response")
glm.eval = rep(0,dim(test)[1])
glm.eval[glm.test > 0.5] = 1
table(glm.eval,test_target)
mean(glm.eval == test_target)
