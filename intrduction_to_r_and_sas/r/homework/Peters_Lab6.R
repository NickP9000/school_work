#1
NBA_data <- data.frame("Jersey" = c(1,2,5,3,35,35),
                       "Player_Yearly_Salary" = c("9e1","$55K",NA,"80","95","95"),
                       "Player_Last_Names" = c("Booker","Okogie",NA, "Beal", "Durant", "Durant"),
                       "Points_Per_Game" = c("26.4P", "12.2P", "21.8P", "27.3P", NA, NA),
                       "Number_of_Cars" = c(7,1,3,3,1,2))

#2
NBA_data = NBA_data[1:4]
NBA_data

#3 Rename the Player_Yearly_Salary to Salary, Player_Last_Names to Name, and Points_Per_Game to Points.
NBA_data = rename(NBA_data,
                  Salary = Player_Yearly_Salary,
                  Name = Player_Last_Names,
                  Points = Points_Per_Game)

#4
NBA_data = drop_na(salary_data, "Name")
glimpse(NBA_data$Name)
NBA_data$Name

#5
NBA_data = distinct(NBA_data)
NBA_data

#6
NBA_data$Points = as.numeric(str_replace_all(NBA_data$Points, "[P]", ""))

#7
NBA_data$Salary = as.numeric(str_replace_all(NBA_data$Salary, "[$K]", ""))

#8
NBA_data$Points = replace_na(NBA_data$Points,34.5)
glimpse(NBA_data$Points)

#9
more_NBA_data <- data.frame("Jersey" = c(8,10,11),
            "Salary" = c(65,75,30),
            "Name" = c("Allen","Lee","Bol"),
            "Points" = c(8.4, 3.5, 2.9))
NBA_data = rbind(NBA_data, more_NBA_data)
glimpse(NBA_data)

#10
extra_NBA_data <- data.frame("Jersey" = c(1,2,3,35,8,10,11),
                             "Position" = c("SG","SG","SG","SF","PG","SG","C"))
NBA_data = merge(NBA_data, extra_NBA_data, by="Jersey")
glimpse(NBA_data)

#11
write.csv(NBA_data,"Lab6.csv", row.names = FALSE)