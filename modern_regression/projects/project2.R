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
waterqual = waterqual[,c(-2,-3,-12,-13,-14,-15,-17)]

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
