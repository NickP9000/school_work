#if/else example
x = sample(1:10, 1) #get random number 1-10
print(x)
if (x < 5){
  print("X is less than 5")
} else{
  print("X is not less than 5")
}

# used on a single value, not an entire vector

# 24
x = sample(1:20, 1)
y = sample(1:20, 1)
print(x)
print(y)
if (x+y>=20){
  print("X+Y is greater than or equal to 20")
} else{
  print("X+Y is less than 20.")
}

# if/else can be done on a single line
x=4
x_even = if(x%%2 == 0) "Even" else "Odd"
print(x_even)

# if/ else if
# 25
mtcars = data(mtcars)
print(mtcars$mpg[1])
if (mtcars$mpg[1] > 30){
  print("High Efficiency")
} else if (mtcars$mpg[1] > 20){
  print("Mid Efficiency")
} else{
  print("Low Efficiency")
}

# use ifelse() to apply a condition to all values of a vector
#Find which elements of a vector are odd/even
a = c(1:5)
b = ifelse(a%%2==0, "Even", "Odd")
print(b)

# make a vector of colors using nested IF statements
library(tidyverse)
cylinder_color = ifelse(mpg$cyl>7, "red", 
                        ifelse(mpg$cyl>5, "yellow", "green"))
ggplot(mpg, aes(displ, y=hwy, colour=cylinder_color)) + geom_point() +
    scale_color_manual(values = c("green", "red", "yellow"))

############LOOPS################################################
library(tidyverse)

glimpse(airquality)

sd(airquality$Day, na.rm=T)
# better way than slightly changing?

# for loops
for (i in 1:10){
  print(i)
}

# can do the same for character vector
charvec = c("first element", "second element", "third element")
for (i in charvec){
  print(i)
}

# seq_along creates a numeric sequence of element indices
seq_along(charvec)

# useful in loops
for (i in seq_along(charvec)){
  print(charvec[[i]])
}

# 26
nums = c(2:100)
for (i in nums){
  if (i%%2==0){
    print(i)
  }
}

### OR
for (i in 2:100) {
  if(i%%2==0){
    print(i)
  }
}
  

