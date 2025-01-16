#Nick Peters
#in-class notes for 11/4

#ggpot 2 (included in tidtyverse)
library(tidyverse)

data(diamonds)
glimpse(diamonds)

#basic plotting
plot(diamonds$carat, # x
     diamonds$price, # y
     col=diamonds$color, # colors
     pch=as.numeric(diamonds$cut) # symbols
     )

#ggplot
ggplot(diamonds,
       aes(carat, price, col=color, shape=cut)) + geom_point() 
# geom_point makes the grap a scatterplot


data(mpg)
glimpse(mpg)

# nothing plotted
ggplot(mpg, aes(class, hwy))

# scatterplot
ggplot(mpg, aes(class, hwy)) + geom_point()

# boxplot/whisker plot
ggplot(mpg, aes(class, hwy)) + geom_boxplot()

# color can be set to represent data from variables
ggplot(mpg, aes(class, hwy, color=cyl)) + geom_point()

# scale_color_gradient to adust the gradient
ggplot(mpg, aes(class, hwy, color=cyl)) + geom_point() +
  scale_color_gradient(low="blue", high="yellow")
# but yellow is difficult to see

# note the change to fill=cyl
ggplot(mpg, aes(class, hwy, color=cyl)) + 
  geom_point() +
  scale_color_gradient(low="blue", high="yellow")

# yellow points are hard to see, let's outline
ggplot(mpg, aes(class, hwy, fill=cyl)) + 
  geom_point(color="black", pch=21) +
  scale_fill_gradient(low="blue", high="yellow")

# change the size 
ggplot(mpg, aes(class, hwy, fill=cyl)) + 
  geom_point(color="black", pch=21, size=5) +
  scale_fill_gradient(low="blue", high="yellow")

#what about bar instead
ggplot(mpg, aes(class, hwy, fill=cyl)) + 
  geom_bar(stat="identity") +
  scale_fill_gradient(low="blue", high="yellow")

# sort by cyl first using arrange
ggplot(arrange(mpg, cyl), aes(class, hwy, fill=cyl)) + 
  geom_bar(stat="identity") +
  scale_fill_gradient(low="blue", high="yellow")

# adding labels
ggplot(mpg, aes(class, hwy, fill=cyl)) + 
  geom_point(color="black", pch=21, size=3) +
  scale_fill_gradient(low="blue", high="yellow") +
  labs(title="HwyMilage by Class and # of Cylinders",
       subtitle="As cylinders increase, hwy mpg goes down",
       caption="Source: mpg dataset",
       x="Class", y="Highway Miles per Gallon")

# pivot our x axis labels using theme
ggplot(mpg, aes(class, hwy, fill=cyl)) + 
  geom_point(color="black", pch=21, size=3) +
  scale_fill_gradient(low="blue", high="yellow") +
  labs(title="HwyMilage by Class and # of Cylinders",
       subtitle="As cylinders increase, hwy mpg goes down",
       caption="Source: mpg dataset",
       x="Class", y="Highway Miles per Gallon") +
  theme(axis.text.x=element_text(angle=60, hjust=1))

# save to a file
ggsave("testing.jpg", width=5)

# 23
ggplot(mpg, aes(displ, hwy)) + geom_point()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  labs(title="HwyMilage vs. Displacement",
       subtitle="As displacement increases, hwy mpg goes down",
       caption="Source: mpg dataset",
       x="Displacement", y="Hwy Miles per Gallon")

# can map color to variables
ggplot(mpg, aes(displ, hwy, color=class)) + geom_point()

# can do the same with size
ggplot(mpg, aes(displ, hwy, size=class)) + geom_point()
# not exactly resonable though

# also not a good idea to do it with alpha
ggplot(mpg, aes(displ, hwy, alpha=class)) + geom_point()
  
# mapping to shape
ggplot(mpg, aes(displ, hwy, shape=class)) + geom_point()
# ggplot will only use 6 shapes, but class has 7 unique values

# facets
# split your plots into facets: subplots that display on subset of the data
ggplot(mpg, aes(displ, hwy)) + geom_point() +
    facet_wrap(~class, nrow=2)

# 24
ggplot(mpg, aes(displ, hwy)) + geom_point() +
    facet_wrap(~cty, nrow=2)
# subplots form a continuous pattern when wrapping a continuous variable
# bad idea

ggplot(mpg, aes(displ, hwy, color=class)) + geom_point() +
  facet_wrap(~year, nrow=2)

# geom_smooth to add line fitted to the data
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()
# uses Local Polynomial Fitting (method="loess")

# linear regression line
ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method=lm)
# grey band is the 95% confidence interval for predictions

# this can be removed by setting se to False
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method=lm, se=F)

