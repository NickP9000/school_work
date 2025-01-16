# double
x = 5
x
typeof(x)

# logical
l <- TRUE
l
typeof(l)

#vectors
vec1 = c(1,2,3,4) #c refers to combine, concatenate, or connect
vec1
is.vector(vec1) #will ouput as true

vec3 = 1:5 #colon operator assigns number 1 through 5
vec3

vec4 = seq(5) #same as 1:5 (ascending)
vec4
?seq

#matrices can be created by column binding or row-binding with cbind
x = 1:4
x
y = 5:8
y
cbind(x,y) #column bind
rbind(x,y) #row bind

#can also use matrix()
X = matrix(c(1,2,3,4), nrow=2, ncol=2)
X = matrix(c(1,2,3,4), nrow=2, ncol=2, byrow=TRUE) # byrow changes how it is stored in the matrix
X

#6.
vectorx = c(1,5,10,100)
vectorx
is.vector(vectorx, mode="numeric")

m = matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
m

#data frames
movie_data = read.csv(file = "IMDBMoviesExercise.csv")
is.data.frame(movie_data)

head(movie_data) #gives you first few rows, tail gives you last few rows

#number of columns
ncol(movie_data) 
#number of rows
nrow(movie_data)

#column names
colnames(movie_data)

#standard deviation
sd(movie_data$Runetime)

#7
book_data = read.csv(file = "Prog.csv")

head(book_data)
colnames(book_data)
nrow(book_data)

summary(book_data$Price) #min/max/average price
summary(book_data$Rating) #min/max/average rating
sd(book_data$Number_Of_Pages)
summary(book_dat$Number_Of_Pages)

#histogram
hist(book_data$Number_Of_Pages)

#scatterplot
plot(book_data$Price, book_data$Rating)
abline(lm(book$Rating ~ book_data$Price, data=book_data, col="blue")) #abline = regression line lm = linear model

#how many books in paperback?
table(book_data$Type)

?subset
?lm

#what is the name of the book with > 3000 pages
big_books = subset(book_data, Number_Of_Pages > 3000)
print(big_books$Book_title)

five_star_books = subset(book_data, Rating >= 5.0)
print(nrow(five_star_books))
five_star_books

good_books = subset(book_data, Rating >=4.5)
print(nrow(good_books))

good_paperbacks = subset(book_data, Rating >= 4.5 & Type == "Paperback")
nrow(good_paperbacks)

#2-d tables
table(book+data$Type, book_data$Rating)

#8
chess_data = read.csv(file="top_women_chess_players.csv")
head(chess_data)

#how many have ranking of FM?
table(chess_data$Title)
#36

#create a two-way table for Title and Year_of_Birth
table(chess_data$Title, chess_data$Year_of_birth)

#keep column 1, 2, 7
book_data_new = book_data[c(1,2,7)]
head(book_data_new)

#you can also use the character column name
book_data_new_col = book_data[c("Rating", "Reviews")]
head(book_data_new_col)

#sorting
book_data_sorted = book_data_new[order(book_data_new$Rating),]
head(book_data_sorted)
#sorts ascending by defaults

#can put a minus sign for descending
book_data_sorted = book_data_new[order(-book_data_new$Rating),]
head(book_data_sorted)

#can also put multiple sort factors
book_data_sorted = book_data_new[order(book_data_new$Price, -book_data_new$Rating),]
head(book_data_sorted)

#merge
movie_info = read.csv(file = "IMDBMoviesExercise.csv")
head(movie_info)
movie_revenue = read.csv(file = "IMDBMoviesRevenueExercise")
head(movie_revenue)

movie_data = merge(movie_info, movie_revenue, by="Title")