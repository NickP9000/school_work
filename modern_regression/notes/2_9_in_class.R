Advertising = read.csv("Advertising.csv", stringsAsFactors=TRUE)

head(Advertising)
Advertising = Advertising[,-1]
head(Advertising)
attach(Advertising)

dim(Advertising)

pairs(Advertising)

# mlr model
lm.fit = lm(sales~TV + radio + newspaper)
summary(lm.fit)
#The p-value associated with the F-statistic is essentially zero. This means we reject H0.
#Therefore, at least one advertising media must be related to sales

#we can get a matrix of correlations
cor(Advertising)
