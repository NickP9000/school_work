#load data
data = read.csv("ifood_df.csv", header=T, na.strings="?", stringsAsFactors=T)
data
dim(data)

#filter out unwanted variables
names(data)
data_subset = data[,c(-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20,-21,-22,-23,-24,-25,-26,-28,-30,-31,-36,-38,-39)]
names(data_subset)
attach(data_subset)

#generate correlation matrix and correlation plot
library(corrplot)
correlation = cor(data_subset)
correlation
corrplot(correlation,method="pi")

#simple linear regression model
lm.slr = lm(Income~MntTotal,data=data_subset)
summary(lm.slr)
#95% confidence interval for MntTotal
predict(lm.slr, data.frame(MntTotal=144), interval="confidence")

#multiple linear regression model
lm.mlr = lm(Income~.,data=data_subset)
summary(lm.mlr)
temp = data.frame()
#95% confidence interval for the coefficients of the mlr model
mlr.coef = data.frame(
  Kidhome = 1, Teenhome = 1, marital_Divorced = 0,
  marital_Single = 0, education_2n.Cycle = 0,
  education_Basic = 1, education_Graduation = 0,
  education_Master = 0, MntTotal = 144
)
predict(lm.mlr, mlr.coef, interval="confidence")

#generate graphs showing regression lines for SLR and MLR models
library(carData)
library(car)
avPlots(lm.slr)
avPlots(lm.mlr)

#make a binary from income
income01 = rep(0,2205)
income01[Income > median(Income)] = 1
#create data subset where Income is replaced with our binary variable
binary_subset = data_subset[,-1]
binary_subset = data.frame(binary_subset, income01)

#establish test and train set
train = (1:1764)
test = (1765:2205)

#logistic regression model
lm.lr = glm(income01~.,data=binary_subset,subset=train,family=binomial)
summary(lm.lr)
#find the accuracy of the model
lr.prob = predict(lm.lr,newdata=data_subset[test,-1],type="response")
lr.pred = rep(0,441)
lr.pred[lr.prob > median(lr.prob)] = 1
table(lr.pred,income01[test])
(114+103)/441 #testing error

#diagnostic plots for the three models
par(mfrow=c(2,2))
plot(lm.slr)
plot(lm.mlr)
plot(lm.lr)
