#Name: Nick Peters

#1
movie_info = read.csv(file = "IMDBMoviesExercise.csv")
head(movie_info)
movie_revenue = read.csv(file = "IMDBMoviesRevenueExercise.csv")
head(movie_revenue)

#2
movie_data = merge(movie_info, movie_revenue, by="Title")
colnames(movie_data)
movie_data = movie_data[c(-3)] #removing description since it is not used in this lab and it makes visualizing rows a nightmare
head(movie_data)

#3
movie_data[order(-movie_data$Revenue),]
#row 664: The Force Awakens has the highest revenue
movie_data[664,]

#4
comedy_movie_data = subset(movie_data, Genre="Comedy") #whoops does not work, needs == not =
head(comedy_movie_data)
summary(comedy_movie_data$Revenue)

#5
action_movie_data = subset(movie_data, Genre="Action", Revenue>1.5) #needs == not =
nrow(action_movie_data)

