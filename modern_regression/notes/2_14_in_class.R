getwd()
setwd("~/Stat108 Code")
getwd()

library(datasets)
library(corrplot)
iris = iris[,1:4]
head(iris)
attach(iris)

#scatterplot matrix
pairs(iris)

correlations = cor(iris)
correlations
corrplot(correlations,"circle")

lm.iris = lm(Sepal.Length~Sepal.Width+Petal.Length+Petal.Width)
summary(lm.iris)

credit = read.csv("Credit.csv", stringsAsFactors = TRUE)
head(credit)
attach(credit)

lm.credit = lm(Income~Limit+Cards+Own)

lm.credit2 = lm(Income~Limit+Cards+Region)

summary(lm.credit)
contrasts(Own) #view qualitative factors
#at least one predictor is related to the response (p-value basically 0)

summary(lm.credit2)
contrasts(Region)

#In model 2, R has two dummy variables RegionSouth and RegionWest. 0 if the region
# is not south/west, 1 if it is.

Advertising = read.csv("Advertising.csv")
head(Advertising)
Advertising = Advertising[,-1]
head(Advertising)
attach(Advertising)

#mlr with interaction term
lm.fit.adv.int = lm(sales~TV+radio+TV:radio)
#or
lm.fit.adv.int = lm(sales~TV*radio)
summary(lm.fit)


#Model including interaction term is superior to the model that contains
# only main effects. The p-value for the interaction term, TVxradio is extremely
# low, indicating there is strong evidence againt H0: beta3 = 0
# In other words, it is clear that the true relationship is not additive
# The R^2 for the model is 96.8% compared to only 89.7% for the model
# that predicts sales using TV and radio w/out interaction term.
# This means that (96.8 - 89.7)/(100 - 89.7) = 69% of the variability
# in sales 


Credit = read.csv("Credit.csv", stringsAsFactors = TRUE)
head(Credit)
attach(Credit)

cr.fit = lm(Balance~Income+Student)

cr.fit.int = lm(Balance~Income+Student+Income:Student)


summary(cr.fit)
summary(cr.fit.int)

#The model with interaction term has a less RSE and higher R^2
# Interaction term seems to be not significant

#Potential Problems in MLR
#non-linearity of the response-predictor relationships
# non-linear pattern in residual vs fitted value plots
#correlation of error terms
# clear pettern in the residuals vs time plots
#non-constant variance of error terms(heteroscedasticity)
# funnel shape in the residual vs fitted value plots
#outliers
# far away points (> 3) in the studentized residuals vs fitted plots
#high-leverage points
# far away points in the studentized residuals vs leverage plots
#collinearity
# large element in absolute value of the correlation matrix of predictors
#multicollinearity
# Varience inflation factor (VIF) exceeds 5 or 10