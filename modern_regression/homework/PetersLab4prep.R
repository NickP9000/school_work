library(ISLR2)
names(Smarket)
dim(Smarket)
summary(Smarket)

cor(Smarket)
cor(Smarket[,-9])

attach(Smarket)
plot(Volume)

glm.fit = glm(Direction~.-Year-Today,data=Smarket,family=binomial)
summary(glm.fit)

coef(glm.fit)

summary(glm.fit)$coef
summary(glm.fit)$coef[,4]

glm.prob = predict(glm.fit, type="response")
glm.prob[1:10]
contrasts(Direction) #dummy variables indicate 1 is Up

#create vector of class predictions
glm.pred = rep("Down",1250)
glm.pred [glm.prob > .5] = "Up"

table(glm.pred, Direction)
(507+145)/1250
mean(glm.pred == Direction)
#testing on the training set is overly optimistic
#100 - 52.16 = 47.8% training error rate

train = (Year < 2005) #vector of observations 2001 - 2004 (values past 2004 are False)
Smarket.2005 = Smarket[!train,] #submatrix of stock market data before 2005 (testing data)
dim(Smarket.2005)
Direction.2005 = Direction[!train] #this the target for our testing data

glm.fit = glm(Direction~.-Year-Today,data=Smarket,family=binomial,subset=train)
glm.prob = predict(glm.fit, Smarket.2005,type="response")

glm.pred = rep("Down", dim(Smarket.2005)[1]) 
glm.pred[glm.prob > .5] = "Up"
table(glm.pred, Direction.2005) #conf matrix

mean(glm.pred == Direction.2005) #training error
mean(glm.pred != Direction.2005) #testing error

glm.fit = glm(Direction~Lag1+Lag2,data=Smarket,family=binomial,subset=train)
glm.prob = predict(glm.fit,Smarket.2005,type="response")
glm.pred = rep("Down",252)
glm.pred[glm.prob > .5] = "Up"
table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
106/(106+76)

predict(glm.fit, newdata = data.frame(Lag1 = c(1.2,1.5), Lag2=c(1.1,-0.8)),type="response")
