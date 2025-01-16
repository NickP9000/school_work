#Regression Code
#DATA CLEANING
data <- read.csv("BKB_WaterQualityData_2020084.csv")
dim(data)

is.na(data)
remove <- na.omit(data$Salinity..ppt.)
data <-data[remove, ]
any(is.na(data))

test <- data[-2]
test <- test[-12]
test <- test[-12]
test <- test[-12]
test <- test[-1]
test <- test[-1]

data <- test[-11]
data <- test[-9]
View(test)

is.na(data)
dim(data)
View(data)
head(data)
#____________________________________
#Displaying Data
corr(data)

glm.fit <- glm(Salinity..ppt. ~., data = data)
par(mfrow=c(2,2))
plot(lm.fit)
#___________________________________________________________

#Ridge Regression
library(glmnet)
library(ISLR2)
attach(data)
#install.packages("leaps")
library(leaps)

regfit.full <- regsubsets(Salinity..ppt. ~ .,data = data)
reg.summary.full <- summary(regfit.full)
reg.summary.full


#sapply(lapply(data, unique), length)
set.seed(1)
x <- model.matrix(Salinity..ppt. ~., data)[, -1]
y <- Salinity..ppt.
grid <- 10^seq(10, -2, length = 100)

#splitting into training and testing
train <- sample(1: nrow(x), nrow(x)/2)
test <- (-train)
y.test <- y[test]
#_____________________________________________

ridge.mod <- glmnet(x[train, ], y[train], alpha = 0, lambda = grid, thresh = 1e-12)
cv.ridge <- cv.glmnet(x[train,], y[train], alpha = 0)
#summary(ridge.mod)
ridge.mod$lambda[5]

coef(ridge.mod)[,5]

#_________________________

cv.ridge1 <- cv.glmnet(x[train,], y[train], alpha = 0)

bestlam <- cv.ridge1$lambda.min
bestlam
ridge.pred <- predict(ridge.mod, s = bestlam, newx = x[test, ])

mean((ridge.pred - y.test)^2)

ridge.out <- glmnet(x, y, alpha = 0)
predict(ridge.out , type = "coefficients", s = bestlam)

summary(pred)

plot(ridge.out)

#NON PARAMETRIC METHOD (TREE)
library(tree)
tree.water <- tree(log(Salinity..ppt.) ~ ., data = data, subset = train)
summary(tree.water)

plot(tree.water)
text(tree.water, pretty = 0)

#Logistic Regression Code
#load dataset and clean it up
waterqual =  read.csv("BKB_WaterQualityData_2020084.csv",header=T,stringsAsFactor=T)
dim(waterqual)
remove = na.omit(waterqual$Salinity..ppt.)
waterqual = waterqual[remove,]
dim(waterqual)
#[1] 726  17
any(is.na(waterqual))
#attach(waterqual)
#View(waterqual)

#remove Site_Id, Unit_Id, Read_Date, Time..24.00., Field_Tech,
#  DateVerified, WhoVerified, Year
waterqual = waterqual[,c(-1,-2,-3,-12,-13,-14,-15,-17)]

#generate correlation matrix and correlation plot
library(corrplot)
correlation = cor(waterqual)
correlation
corrplot(correlation,method="pi")

#create a binary variable from Salinity..ppt.
salinity01 = rep(0,726)
salinity01[waterqual$Salinity..ppt. > median(waterqual$Salinity..ppt.)] = 1
#create data subset where Income is replaced with our binary variable
binary_subset = waterqual[,-1] #include everything but Salinity in binary set
binary_subset = data.frame(binary_subset, salinity01)
attach(binary_subset)

#train/test split
set.seed(1)
train = sample(c(T,F),nrow(waterqual)/2,replace=T)
test = (!train)

#logistic regression model
lm.lr = glm(salinity01~.,data=binary_subset,subset=train,family=binomial)
summary(lm.lr)

#confusion matrix
test_target = salinity01[test]
pred = predict(lm.lr,binary_subset[test,],type="response")
eval = rep(0,length(test_target))
eval[pred > 0.5] = 1
table(eval,test_target)
