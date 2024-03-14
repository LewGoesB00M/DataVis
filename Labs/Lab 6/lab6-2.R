library(ggplot2)

ggplot(data = mpg, aes(cty, hwy)) +
  geom_point() +
  facet_grid(. ~ cyl)

ggplot(data = mpg, aes(cty)) +
  # In a histogram, values are divided based on groups. For example, grades are grouped 60 - 70,
  # 80 - 90, etc. That would be a bin width of 10.
  geom_histogram(binwidth = 2) +
  facet_grid(cyl ~ .)

ggplot(data = mpg, aes(cty)) +
  geom_histogram(binwidth = 2) +
  facet_grid(drv ~ cyl)
# ^ Shows all combinations here, including ones with no rows.

nrow(mpg) # 234
mpg2 <- subset(mpg, cyl != 5 & drv %in% c("4", "f"))
nrow(mpg2) # Now 205, excludes 29 RWDs.
# In quiz, likely not this exact code but similar.

ggplot(data = mpg2, aes(cty, hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl) # I still can't tell why margins = T does what it does.


ggplot(data = mpg, aes(x = displ, y = hwy)) +
  facet_wrap(. ~ cyl)