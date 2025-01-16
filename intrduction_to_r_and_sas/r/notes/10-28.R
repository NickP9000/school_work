library(nycflights13)
library(tidyverse)

# tibble vs dataframe
# tibbles - data frames but slightly tweaked to work better w/tidyverse
# printing - tibbles have a refined printing method, shows first 10 rows, and all coulmns that fit on screen
# subsetting - if you try to get a columns that does not exist, it will produce an error
?flights
glimpse(flights)
print(flights)
flights$yea #error

jan1 = filter(flights, month==1, day==1)
jan1

#excercise 12
delay = filter(flights, dep_delay>60, arr_delay<30)
nrow(delay)

#tidyverse select() works similar to movie_data[c("Title","Year")]
#13
flights2 = select(flights, "year", "dest","arr_delay")
flights2

#tidyverse arrange() works similar to order()
#14
flights3 = arrange(flights2, desc(arr_delay))
flights3

#tidyverse top_n() works like first_movie_data = movie_data[1:3,]
#15
my_delayed_flights = top_n(flights3, n=3)
head(my_delayed_flights)

#example of piping
flights %>% select("year","dest","arr_delay") %>% arrange(desc(arr_delay)) %>% top_n(3)

#saving and printing
(dec25 = filter(flights, month==12, day==25))
#

#what are the 5 flights that have the longest delays?
#piping
flights %>% slice_max(dep_delay, n=5) %>% select("day","month","dest","dep_delay")

#no piping
top_five_longest_delays = slice_max(flights, dep_delay, n=5)
select(top_five_longest_delays, "day", "month", "dest", "dep_delay")

#16
flights %>% slice_min(air_time, n=3) %>% select("month", "day", "flights", "tailnum", "origin", "dest", "air_time")

top_3_shortest_flights = slice_min(flights, airtime, n=3)
select(top_3_shortest_flights, "month", "day", "flights", "tailnum", "origin", "dest", "air_time")

#mutate allows the addition of calculated columns
flights_with_gain = mutate(flights, gain=dep_delay-arr_delay)
flights_with_gain %>% select("month", "day", "flight", "origin", "dest", "dep_delay", "arr_delay", "gain")

#17
mean(flights_with_gain$gain, na.rm=T)

#18
flights_with_speed = mutate(flights, speed=distance/air_time*60)
#average airspeed of all flights?
mean(flights_with_speed$soeed, na.rm=T)

#fastest airspeed?
flights_with_speed %>% slice_max(speed, n=1) %>% select("month", "day", "flight", "origin", "dest", "speed")
#OR
slice_max(flights_with_speed, speed, n=1)
#OR
arrange(flights_with_speed, desc(speed))[1,c("month", "day", "flight", "origin", "dest", "speed")]

#19
movie_data = read.csv(file="IMDBMoviesExercise.csv")
revenue_data = read.csv(file="IMDBMoviesRevenueExercise.csv")
movie_revenue_data = merge(movie_data, revenue_data, by="Title")

mutate(movie_revenue_data,
       success=Rating*Revenue) %>% slice_max(success, n=5) %>% select("Title", "Rating", "Revenue", "Genre", "success")

#other interesting questions
#What is the average departure for each of the airports?
table(flights$origin)

#JFK
JFK = filter(flights, origin="JFK")
mean(JFK$dep_delay, na.rm=T)

#Newark
EWR = filter(flights, origin="EWR")
mean(EWR$dep_delay, na.rm=T)

#LaGuardia
LGA = filter(flights, origin="LGA")
mean(LGA$dep_delay, na.rm=T)

# summarize() collapses a dataframe to a single row
# result will contain one column for each grouping variable and one column for each of the summary statistcs specified
summarize(flights, delay=mean(dep_delay, na.rm=TRUE))
# is the same as
mean(flights$dep_delay, na.rm=T)

#summarize() is better when pair with group_by()
#ex get the average delay per origin airport
by_airport = group_by(flights, origin)
summarize(by_airport, delay=mean(dep_delay, na.rm=TRUE))

#group by data
by_day = group_by(flights, year, month, day)
delay_per_date = summarize(by_day, delay=mean(dep_delay, na.rm=TRUE))
#note the result is another data frame (tibble)

# what is going on here?
slice_max(delay_per_date, delay, n=5)
#slice_max will prioritize the group of the data
# top 5 delays for EACH YEAR/MONTH group

# what are the top five dates with the largest delay values?
slice_max(ungroup(delay_per_date), delay, n=5)

#what are the top five dates with the largest delay averages?
#piping to the rescue
flights %>%
  group_by(year, month, day) %>%
  summarize(
    count = n(), #number of flights
    dist = mean(distance, na.rm=TRUE),
    delay = mean(arr_delay, na.rm=TRUE)
  ) %>%
  ungroup() %>%
  slice_max(delay, n=5)

#20
flights %>%
  group_by(carrier) %>%
  summarize (
    count = n(), #number of flights
    median_delay = median(arr_delay, na.rm=TRUE)
  ) %>% arrange(median_delay)

#21
movie_data = read.csv(file="IMDBMoviesExercise.csv")
revenue_data = read.csv(file="IMDBMoviesRevenueExercise.csv")
movie_revenue_data = merge(movie_data, revenue_data, by="Title")

movie_revenue_data %>%
  group_by(Genre) %>%
  summarize(
    count = n(), # number of movies
    median_revenue = median(Revenue, na.rm=T)
  ) %>% arrange(desc(median_revenue))
  



