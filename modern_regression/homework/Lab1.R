getwd()
setwd("~/Stat108 Code")
getwd()

college = read.csv("college.csv",  header=T, stringsAsFactors=T)

View(college)

dim(college)

college = college[-c(1,0)]

View(college)

summary(college)

names(college)
pairs(~Private+Apps+Accept+Enroll+Top10perc,data=college)
#pairs(,1:5)

plot(college$Private,college$Outstate, xlab="Private",ylab="Outstate", main="Private vs Outstate")

hist(college$Apps, xlab="Apps", main="Histogram of College Applications")
hist(college$Accept, xlab="Accept", main="Histogram of College Acceptances")

par(mfrow = c(1,2))
hist(college$Apps)
hist(college$Accept)
