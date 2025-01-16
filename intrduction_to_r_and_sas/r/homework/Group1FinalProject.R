# Group 1 R Code
# Written by Nick Peters

# import tidyverse
library(tidyverse)


# read in and explore the data
city_revenue_data = read.csv(file="City_Budget_and_Actual_Revenue.csv")
glimpse(city_revenue_data)


# remove unneeded columns (Record.Key, County.Code, GNIS.Feature.ID, City.Code, Primary.City.Coordinates)
city_revenue_data = select(city_revenue_data, "Fiscal.Year", "County", "City.Name", "Revenue.Type", "Budget", "Actual")
glimpse(city_revenue_data)


# get all the column names and find what columns have NA
names = colnames(city_revenue_data)
for (i in names) {
  if(anyNA(city_revenue_data[i])) {
    print(i)
    print(anyNA(city_revenue_data[i]))
  }
}
# NA in Actual column, we will transform NA values, replacing them with the average


# transform NA and check to ensure all NA is gone
city_revenue_data$Actual[is.na(city_revenue_data$Actual)] = mean(city_revenue_data$Actual,na.rm=TRUE)
anyNA(city_revenue_data$Actual)


# find number of rows and columns
dim(city_revenue_data)
# 215280 rows and 6 columns


# display column names
colnames(city_revenue_data)


# use pipe operator to summarize the Actual column by Fiscal Year
city_revenue_data %>% group_by(Fiscal.Year) %>% summarize(mean(Actual))


# ungroup to ensure no issues with slice max/min later
ungroup(city_revenue_data)


# let's look at the frequency of each county
table(city_revenue_data$County)


# outpput min, max, mean, and standard deviation of Actual column
summary(city_revenue_data$Actual)
# min = -40459165, max = 331822353, average = 662013
sd(city_revenue_data$Actual)
# standard deviation = 5036606


# initialize a data frame to merge in
df = data.frame(
  Fiscal.Year = 2021,
  County = "WARREN",
  City.Name = "INDIANOLA",
  Revenue.Type = "Miscellaneous",
  Budget = 0,
  Actual = 2000
)


# merge in the new data and explore
merged_data = merge(city_revenue_data, df, by="City.Name")
glimpse(merged_data)


# use filter to focus on Johnson County
johnson_county_revenue = filter(city_revenue_data, County=="JOHNSON")
glimpse(johnson_county_revenue)


# use arrange to look at Budget from greatest to least
johnson_county_revenue %>% arrange(desc(johnson_county_revenue$Budget))


# use slice max/min to view the top and bottom 3 Actual costs
slice_max(johnson_county_revenue, order_by=Actual, n=3)
slice_min(johnson_county_revenue, order_by=Actual, n=3, with_ties=FALSE)


# add a calculated column called Difference to analyze whether the county was over/under budget
johnson_county_revenue = mutate(johnson_county_revenue, Difference = Actual - Budget)


# group by fiscal year and summarize the mean of the column that was just created
johnson_county_revenue %>% group_by(Fiscal.Year) %>% summarize(mean(Difference, na.rm=TRUE))


# remove character variables so correlation is easy to calculate
johnson_county_numeric = johnson_county_revenue[-c(2,3,4)]
cor(johnson_county_numeric)


# let's visualize the relationship between Actual,Budget, and Difference
ggplot(johnson_county_revenue, aes(Budget, Actual)) + geom_point() + geom_smooth(method="lm", se=FALSE) +
  labs(title="Johnson County Budget vs. Actual Spending")

ggplot(johnson_county_revenue, aes(Budget, Difference)) + geom_point() + geom_smooth(method="lm", se=FALSE) +
  labs(title="Johnson County Buget vs. Difference",
       subtitle="Greater than 0 is over budget and less than 0 is under budget")


# initialize a function to remove outliers from the data to ensure better visualization
remove_outliers = function(x) {
  Q <- quantile(x, probs=c(.25, .75), na.rm = FALSE)
  iqr <- IQR(x)
  new_data = subset(johnson_county_revenue, x > (Q[1] - 1.5*iqr) & x < (Q[2]+1.5*iqr))
  new_data
}


# use the remove_outliers function to remove outliers from Budget, Actual, and Difference
johnson_county_no_outliers = remove_outliers(johnson_county_revenue$Budget)
johnson_county_no_outliers = remove_outliers(johnson_county_revenue$Actual)
johnson_county_no_outliers = remove_outliers(johnson_county_revenue$Difference)


# display the number of rows and columns in the data which will be used for visualizations
dim(johnson_county_no_outliers)
# 1773 rows and 7 columns

# let's look at a box plot grouped by City Name
ggplot(johnson_county_no_outliers, aes(City.Name, Difference, group=City.Name)) + geom_boxplot() +
  labs(title="Box Plot of Difference in Budget and Actual Spending by City", x="City Name" )


# filter out 2024 and 2025 entries because they are most likely incomplete, look at 2007-2023
date_fixed = filter(johnson_county_no_outliers, Fiscal.Year < 2024)

# now let's group by Fiscal Year
ggplot(date_fixed, aes(Fiscal.Year, Difference, group=Fiscal.Year)) + geom_boxplot() +
  labs(title="Box Plot of Difference in Budget and Actual Spending by Year", x="Fiscal Year")

