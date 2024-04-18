library(ggplot2)
library(plotly)

# Question 1
plot <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = cut)) +
  labs(x = "Carat", 
       y = "Price", 
       color = "Cut",
       title = "Diamond prices by Carat and Cut") +
  scale_y_continuous(label = scales::dollar) +
  facet_grid(color ~ cut)

ggplotly(plot)

# Question 2
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  xlim(c(2, 6)) +
  ylim(c(15, 35))

# Question 3
plot <- ggplot(diamonds, aes(clarity, group = cut)) + 
  geom_freqpoly(aes(color = cut), stat = "count")

ggplotly(plot)

       