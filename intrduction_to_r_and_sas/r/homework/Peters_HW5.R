#Name: Nick Peters
#1
movies = read.csv(file="MoviesData.csv")
head(movies)
movie_streaming = read.csv(file="MoviesStreaming.csv")
head(movie_streaming)

movie_data = merge(movies, movie_streaming, by="ID")
head(movie_data)

#2
hist(movie_data$IMDb, main="Histogram of IMDb Scores", xlim=range(c(0,10)), ylim=range(c(0,3000)), col="yellow", xlab="Score")

hist(movie_data$Rotten.Tomatoes, main="Histogram of Rotten Tomatoes Scores", xlim=range(c(0,100)), ylim=range(c(0,700)), col="red", xlab="Score")

#3
table(movie_data$Genres)

#4
colnames(movie_data)
movie_info = subset(movie_data[c(1, 2, 3, 9)])
head(movie_info)

#5
drama_movies = subset(movie_data, Genres=="Drama")
mean(drama_movies$IMDb, na.rm=TRUE) #need na.rm=TRUE to remove na value and get the mean

#6  
horror_movies = subset(movie_data, Genres=="Horror")
horror_movies = horror_movies[order(-horror_movies$IMDb),]
print(horror_movies$Title[1])

#7
sum(movie_data$Netflix == 1)
sum(movie_data$Hulu == 1)
sum(movie_data$Prime.Video == 1)
sum(movie_data$DisneyPlus == 1)

#8
duplicate_subset = subset(movie_data, movie_data$DisneyPlus == movie_data$Prime.Video)
 
duplicate_streaming = sum(duplicate_subset$DisneyPlus == 1)
total = sum(movie_data$DisneyPlus == 1, movie_data$Prime.Video == 1)
print(total - duplicate_streaming)