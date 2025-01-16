library(tidyverse)

movie_data = read.csv(file="IMDBMoviesExercise.csv")
revenue_data = read.csv(file="IMDBMoviesRevenueExercise.csv")
movie_revenue_data = merge(movie_data, revenue_data, by="Title")

anyNA(movie_revenue_data$Revenue)
anyNA(movie_revenue_data$Runtime)
anyNA(movie_revenue_data$Rating)

movie_revenue_data = drop_na(movie_revenue_data, "Revenue")

cor(movie_revenue_data$Revenue, movie_revenue_data$Runtime)

revenue_v_rating = lm(Revenue~Rating, movie_revenue_data)
plot(Revenue~Rating, data=movie_revenue_data,
     xlab="Rating",
     ylab="Revenue in Millions of Dollars ($)")
abline(revenue_v_rating, col="red")

