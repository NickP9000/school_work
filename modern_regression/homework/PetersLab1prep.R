x <- c(1,3,2,5)
x

x = c(1,6,2)
x
y = c(1,4,3)

length(x)
length(y)
x + y

ls()
rm
ls()

#deletes all variables
rm(list = ls())

?matrix

x = matrix(data=c(1,2,3,4),nrow=2,ncol=2)
x

x = matrix(c(1,2,3,4),2,2)

matrix(c(1,2,3,4),2,2,byrow=TRUE)

sqrt(x)
x^2

#generate vector of random, normal variables
x = rnorm(50)
y = x + rnorm(50,mean=50,sd=.1)
cor(x,y)

#we can set a seed so that to reproduce the an exact set of normal, random variables
set.seed(1303)
rnorm(50)

set.seed(3)
y = rnorm(100)
#mean
mean(y)
#variance
var(y)
#one way to do standard deviation
sqrt(var(y))
#or
sd(y)

x = rnorm(100)
y = rnorm(100)
plot(x,y)
#can name axes
plot(x,y,xlab="x-axis",ylab="y-axis",main="Plot of X vs Y")

pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()

#create sequence of numbers
x = seq(1,10)
x
x = 1:10
x
x = seq(-pi,pi,length=50)
x

#represent 3d data
y = x
f = outer(x,y,function(x,y) cos(y) / (1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa = (f-t(f))/2
contour(x,y,fa,nlevels=15)

#visualize 3d data differently
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

A = matrix(1:16,4,4)
A

#select a specific element in a matrix
A[2,3]

#select slices from a matrix
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:3,]
A[,1:2]

A[1,]

#keep all but
A[-c(1,3),]

dim(A)

#Issue: missing data + data is formatted incorrectly
Auto = read.table("Auto.data")
View(Auto)
head(Auto)

#We can fix
#na.strings="?" tells it what to read as missing values, still apart of data
Auto = read.table("Auto.data", header=T, na.strings="?", stringsAsFactors=T)
View(Auto)

Auto = read.csv("Auto.csv", na.strings="?", stringsAsFactors=T)
View(Auto)
dim(Auto)
Auto[1:4,]

#We can omit missing values
Auto = na.omit(Auto)
dim(Auto)

#get the variable names
names(Auto)

#does not know where cylinders and mpg are
plot(cylinders,mpg)


plot(Auto$cylinders, Auto$mpg)
#By attaching to variable names, we can drop the use of Auto
attach(Auto)
plot(cylinders, mpg)

#currently, we need to make cylinders a categorical variable since it reads as a numerical
cylinders = as.factor(cylinders)

plot(cylinders,mpg)
plot(cylinders,mpg,col="red")
plot(cylinders,mpg,col="red",varwidth=1)
plot(cylinders,mpg,col="red",varwidth=1,horizontal=T)
plot(cylinders,mpg,col="red",varwidth=,xlab="cylinders",ylab="MPG")

#2=red
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)

#scatterplot matrix
pairs(Auto)
pairs(~mpg+displacement+horsepower+weight+acceleration,data=Auto)

plot(horsepower,mpg)
identify(horsepower,mpg,name)

summary(Auto)

summary(mpg)

q()
