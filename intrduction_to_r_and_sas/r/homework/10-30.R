library(tidyverse)
library(nycflights13)

#Correlations
?cor
?mtcars

cars = select(mtcars, "mpg", "hp", "wt", "qsec")
# mpg = miles/gallon
# hp = horsepower
# wt = weight (in 1,000 pounds)
# qsec = 1/4 mile time

#output the correlation coefficient matrix
cor(cars)

#install.packages("corrplot")
library(corrplot)

corrplot(cor(cars))

#22
#correlation coefficient between Ratings and Revenue?
movie_data = read.csv(file="IMDBMoviesExercise.csv")
revenue_data = read.csv(file="IMDBMoviesRevenueExercise.csv")
movie_revenue_data = merge(movie_data, revenue_data, by="Title")

anyNA(movie_revenue_data$Revenue)
anyNA(movie_revenue_data$Rating)

movie_revenue_data = drop_na(movie_revenue_data, "Revenue")
movie_revenue_data = drop_na(movie_revenue_data, "Rating")

cor(movie_revenue_data$Revenue, movie_revenue_data$Rating)
cor(movie_revenue_data$Rating, movie_revenue_data$Runtime)
         
#linear regression
model = lm(mpg~wt, mtcars)

#get statistics of model
summary(model)
coef(model)

#plot the scatter plot and linear regression line
plot(mpg~wt, data=mtcars,
     xlab="Weight",
     ylab="Miles per Gallon",
     main="Scatter Plot with Linear Regression")
abline(model, col="blue")
