getwd()
setwd("Stat108 Code")
getwd()


library(ISLR2)
Default = Default
head(Default)
attach(Default)

summary(Default)

#logistic regression. family=binomial because of binary possibilities
d.fit = glm(default~balance,family=binomial)
summary(d.fit)
#The logistic regression model on the Default data in order to predict the
# probability of default=Yes using balance. Since estimate for the balance
# is approximately 0.0055, one-unit increase in balance is associated
# with an increase in the log odds of default by 0.0055 units.
# Since p-value for balance is smaller than 0.05 there is indeed an
# association between balance and probability of default.

d.fit$coefficients
exp(-10.651330614+0.005498917*1000)/(1+exp(-10.651330614+0.005498917*1000))
#0.005752145

exp(-10.651330614+0.005498917*2000)/(1+exp(-10.651330614+0.005498917*2000))
#0.5857694

#or
predict(d.fit, newdata=data.frame(balance=c(1000,2000)),type="response")

glm.fit = glm(default~.,family=binomial,data=Default)
summary(glm.fit)
contrasts(student)
#the p-values of student and balance are especially small, indicating
# that they are associated with default.

predict(d.fit, newdata=data.frame(balance=c(1500),income=c(40000)),type="response")
#0.08294762 

Weekly = Weekly
?Weekly  
head(Weekly)
summary(Weekly)

attach(Weekly)

dim(Weekly)
pairs(Weekly, col="blue")

#mathematical in nature, so need to accommodate Weekly for that if want to use
#(problems with categorical variable)
correlations = cor(Weekly[,-9])


glm.fit = glm(Direction~.-Year-Today,data=Weekly,family=binomial)
summary(glm.fit)
#Lag2 seems to be statistically significant P 0.0296 < 0.05

#predict() can be used to predict probability, P(Y = 1|x) that the market
#will go up, given values of the predictors
#W/no data set supplied, the probabilities are computed for the training
#set that was used to fit the logistic regression model
glm.prob = predict(glm.fit, type='response')
glm.prob[1:10] #first ten probabilities that the market going "Up"
contrasts(Direction)

glm.pred = rep("Down", 1089)#create vector of 1089 Down elements
glm.pred[glm.prob > .5] = "Up"
#The above transforms to "Up" all of the elements for which the predicted
#probability market increase exceeds 0.5

table(glm.pred,Direction) #confusion matrix
#Diagonal = correct predictions
#our model overfits

(557+54)/1089
#or
mean(glm.pred == Direction)
#logistic regression correctly predicted the movement of the market
#56.1% of the time

#result is misleading since we trained and tested the model on the same
#set of 1089 observations.
#100% - 56.1% = 43.9%, is the training error rate

#vector corresponding to observations from 1990 through 2008
train = (Year < 2009) #1990 to 2008

test = Weekly[!train,] #! is not, so used to reverse all
#elements of the Boolean vector train

test.target = Direction[!train] # need for calculating prediction error

#train a regression model on the training set
glm.fit.train = glm(Direction~Lag2, data=Weekly, family=binomial, subset=train)


#now we can 
glm.prob.test = predict(glm.fit.train,test,typ="response")
glm.pred.test = rep("Down", dim(test)[1])
glm.pred.test [glm.prob.test > 0.5] = "Up"

table(glm.pred.test, test.target)
mean(glm.pred.test == test.target)
#62.5% accuracy rate
#100-62.5 = 37.5% test error rate
#Now results appear better compared to 56.1% previously

#The model suggests a possible trading strategy of busing on days when
#the model predicts an increasing market, and avoiding trades on days
# when a decrease is predicted