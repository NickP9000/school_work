# creating an empty vector
my_vec = vector()
# elements can be added later
my_vec[[1]] = 1
my_vec[[2]] = 2
my_vec[[3]] = "abc"
my_vec
# vectors must have same data type, so "1" and "2" become characters like "abc"

my_vec = vector()
my_vec[[1]] = 1
my_vec[[2]] = 2
my_vec[[4]] = 4
my_vec
# NA will be inserted since we didn't assign my_vec[[3]]

# create a default numeric vector with 10 elements
numbers = vector("double", 10) 
numbers

# character vector
characters = vector("character", 10)
characters

# vectors can be useful in loops 
library(tidyverse)

# find the standard deviations of the columns of the airquality dataset
stddev = vector("double", ncol(airquality))
for (i in seq_along(airquality)) {
  stddev[[i]] = sd(airquality[[i]], na.rm=T)
}
stddev

# 27: Make a vector of the average values of all elements of mpg’s numeric types
numeric_mpg = mpg %>% select("displ", "year", "cyl", "cty", "hwy")
mpg_averages = vector("double", ncol(numeric_mpg))
for (i in seq_along(numeric_mpg)) {
  mpg_averages[[i]] = mean(numeric_mpg[[i]], na.rm=T)
}
mpg_averages

# create an empty list
my_list = list()
# add items
my_list[[1]] = "here I am"
my_list[[2]] = 2
my_list[[3]] = "ok"
my_list
# list leaves 2 as numeric

# looping through lists
# 1. using a target variable
for (i in my_list) {
  print(i)
}

# 2. using an index
for (i in seq_along(my_list)) {
  print(my_list[[i]])
}

# 28: Create an empty vector. Insert only even numbers between 2 and 20.
my_vec = vector()
for (i in c(2:20)) {
  if (i %% 2 == 0) {
    my_vec = append(my_vec, i)
  }
}
my_vec

# OR
my_vec = vector()
ndx = 1
for (i in c(2:20)) {
  if (i %% 2 == 0) {
    my_vec[[ndx]] = i
    ndx = ndx + 1
  }
}
my_vec

# paste allows us to concatenate strings with integers
paste(1,2,3)
# default sep = " "
paste("data",1,".csv",sep="")

# 29: Create a vector of 10 characters… “file1.csv”
filenames = vector("character", 10)
for (i in c(1:10)) {
  filenames[[i]] = paste("file",i,".csv",sep="")
}
filenames

# 30: Download temp1.csv, temp2.csv, temp3.csv Create a vector, filenames, that consists of the appropriate filenames
filenames = vector("character", 3)
for (i in c(1:3)) {
  filenames[[i]] = paste("temp",i,".csv",sep="")
}
filenames

# read the data from files into a list of data frames
data_list = list()
for (i in seq_along(filenames)) {
  data_list[[i]] = read.csv(file=filenames[[i]])
}
data_list

# bind all columns together
temps = bind_cols(data_list)
temps

# example of range
my_vec = c(0,4,-3,54,6,-19,2)
rng = range(my_vec)
print(rng)
# min
rng[[1]]
# max
rng[[2]]

# the normal distribution
rnorm(10)
# density, distribution function, quantile function, and random generation for the normal distribution
#   with mean equal to mean and standard deviation equal to sd

# create a data frame with some numbers in it
df = data.frame(
    a = rnorm(10),
    b = rnorm(10),
    c = rnorm(10),
    d = rnorm(10)
)
df

# what does this do?
# 31
df$a = (df$a - min(df$a, na.rm=T)) / 
  (max(df$a, na.rm=T)) - min(df$a, na.rm=T)
df$a
# re-scales the random data frame to be above zero

# re-write the above
x = df$a
(x- min(x, na.rm=T))/ (max(x, na.rm=T) - min(x, na.rm=T))

# use the range function
rng = range(x, na.rm=T)
(x-rng[1])/(rng[2]-rng[1])

# now turn it into a function
rescale01 = function(x) {
  rng = range(x, na.rm=T)
  min = rng[1]
  max = rng[2]
  (x - min) / (max - min)
}