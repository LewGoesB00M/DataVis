# Lewis Higgins, Student ID 22133848
# Code for CMP5352 Data Visualisation Quiz 1

# Necessary for diamonds and mpg dataset, and the graph plotting.
library(ggplot2)

# Question 1
# First graph shows the relation of carats and price by color.
qplot(log(carat), log(price), data = diamonds, color = color, geom = c("point", "smooth"))

# Second graph shows the relation of carats and price by cut.
qplot(log(carat), log(price), data = diamonds, color = cut, geom = c("point", "smooth"))


# Question 2
# Produces 4 plots, one for each amount of cylinders.
qplot(displ, hwy, data = mpg, facets = cyl ~ ., color = factor(cyl), geom = c("point", "smooth"))

# Quesiton 3
# Colors by cylinder, and adds smootihng lines for each color.
qplot(displ, hwy, data = mpg, color = factor(cyl), geom = c("point", "smooth"))

# For the exact numbers for the hwy values.
# View(mpg)
