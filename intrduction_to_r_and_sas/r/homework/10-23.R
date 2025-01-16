library(tidyverse)


#1 read and explore data
my_data <- data.frame("ID" = c(1:5,5),
                      "Employee Yearly Salary" = c("6e1","$70K",NA,"65","80","80"),
                      "Employee Names" = c("John","Dora",NA, "George", "Bill", "Bill"),
                      "Sales" = c("100,000", "200,000", "2,000", "150,000", NA, NA),
                      "Number of Children" = c(0,3,2,0,1,1) )

glimpse(my_data) #tidyverse tibble

#2 drop unnecessary columns (Number.of.Children in this case)
salary_data = my_data[1:4]
#OR
salary_data = my_data[c("ID","Employee.Yearly.Salary","Employee.Names","Sales")]

#3 rename columns (from tidyverse dplyr)
salary_data = rename(salary_data,
                     Salary = Employee.Yearly.Salary,
                     Name = Employee.Names)

#4 filter data by removing NA rows (tidyr)
salary_data = drop_na(salary_data, "Name")

#5 Remove duplicates
salary_data = distinct(salary_data)
salary_data

#6 transform/create cols
str_replace_all(salary_data$Sales, "[,]", "")
# still not complete because the values are character types
salary_data$Sales = as.numeric(str_replace_all(salary_data$Sales, "[,]", ""))
# removes $ and K from Salary values, converts to numeric, reassigning in the dataframe
salary_data$Salary = as.numeric(str_replace_all(salary_data$Salary, "[$K]", ""))

#7 recode variables (tidyr)
salary_data$Sales = replace_na(salary_data$Sales,0)

#8 merge and/or append data
more_data <- data.frame("ID" = 10:12,
                        "Salary" = c(55,88,96),
                        "Name" = c("Jane","Sally","Kay"),
                        "Sales" = c(100000, 200000, 2000))

#use rbind to add rows vertically
salary_data = rbind(salary_data, more_data)

#use merge to add data to existing rows (e.g. horizontally)
extra_data <- data.frame("ID" = c(1,2,4,5,10:12),
                         "Position" = c("VP","Pres","SE","X","VP","I","VP"))
salary_data <- merge(salary_data, extra_data, by="ID")

#9 export data
write.csv(data_frame,"output_filename.csv", row.names = FALSE)
#not including row.names=FALSE will add row numbers, which are not always wanted

