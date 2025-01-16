getwd()

setwd("~/Stat108 Code")

getwd()

install.packages("ISLR2")

library(ISLR2)

library(datasets)

head(iris)

iris$Sepal.Length

x=7

x

print(x)

y<-2

y

head(mtcars)

#bar chart
cyl = table(mtcars$cyl)

barplot(cyl)

hist(mtcars$hp)

hist(mtcars$hp, col = "blue", main = "Horsepower", xlab = "horsepower", ylab = "frequency")

plot(mtcars$wt, mtcars$mpg)

summary(mtcars$mpg)

summary(iris$Species)
