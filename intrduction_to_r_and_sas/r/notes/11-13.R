library(tidyverse)
#
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

min = rng[1]
max = rng[2]

# now turn it into a function
rescale01 = function(x) {
  rng = range(x, na.rm=T)
  (x - rng[1]) / (rng[2] - min[1])
}

# test it out
rescale01(c(0, 5, 10))

rescale01(c(-10, 0, 10))

rescale01(c(1, 2, 3, NA, 5))

# after
df = data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
df

df$a = rescale01(df$a)
df$b = rescale01(df$a)
df$c = rescale01(df$a)
df$d = rescale01(df$a)

# still quite a bit of duplication (could be solved with loops)

positive.count = function(x) {
  count = 0
  for (i in seq_along(x)) {
    if (x[[i]] > 0) {
      count = count + 1
    }
  }
  count # return count
}

# "easy" way to do the above
my_vec = c(4, 6, -2, -1, 4)
positive.count(my_vec)

# 33
both_na = function(x, y) {
  count = 0
  for (i in seq_along(x)) {
    if (is.na(x[[i]]) && is.na(y[[i]])) {
      count = count + 1
    }
  }
  count # return count
}

# test it out
my_vec2 = c(2, NA, 1, NA, NA)
my_vec3 = c(1, NA, 1, NA, 1)
both_na(my_vec2, my_vec3)

dates = vector("character", 10)
for (i in seq_along(dates)){
  dates[[i]] = paste("11/",i,"/20",sep="")
}
dates


#create a data frame with some numbers in it
df = data.frame(
  date = c(dates),
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
df

glimpse(df)

ggplot(data=df, aes(group=1)) +
  geom_line(aes(x=date,y=a,color="A"), size=2) +
  geom_line(aes(x=date,y=b,color="B"), size=2) + 
  geom_line(aes(x=date,y=c,color="C"), size=2) +
  geom_line(aes(x=date,y=d,color="D"), size=2) +
  scale_color_manual(values=c(
    "A" = "darkblue",
    "B" = "red",
    "C" = "green",
    "D" = "yellow"
    )
  )


