library(ggplot2)

# This isn't faceting anything, so it's just one graph.
ggplot(data = mpg, aes(cty, hwy)) + geom_point() + facet_grid(. ~ .)

# If we instead facet using a third variable, it'll be split into multiple graphs based on variable 3.
ggplot(data = mpg, aes(cty, hwy)) + geom_point() + facet_grid(. ~ cyl)

# The faceting is easiest to modify by making a subset with the given rule. <- ON QUIZ!!!
# Here, I'm faceting by cylinders but I don't want to include 5 cylinders bc it's only 4 rows.
# nrow(subset(mpg, cyl == 5)) 4 rows
mpg2 <- subset(mpg, cyl != 5)
ggplot(data = mpg2, aes(cty, hwy)) + geom_point() + facet_grid(. ~ cyl)

# We can have it go horizontally, too - facet_grid(X ~ Y)
# It's probably better do do this for histograms so our X axis is easier to interpret and not narrow.
ggplot(data = mpg2, aes(cty)) + geom_histogram(binwidth = 2) + facet_grid(cyl ~ .)

# Subsetting can have multiple conditions, which can help to make some nice graphs.
# Not 5 cyl, but must be 4-wheel drive or front-wheel drive.
      # Not 5 cyl, not rear-wheel drive basically.
mpg2 <- subset(mpg, cyl != 5 & drv %in% c("4", "f"))
ggplot(data = mpg2, aes(cty, hwy)) + geom_point() + facet_grid(drv ~ cyl)

# You can add smooth lines to your faceted grids.
ggplot(data = mpg2, aes(displ, hwy)) + geom_point() + geom_smooth(method = "lm") +
  facet_grid(cyl ~ drv, margins = T) # I don't know what margins does.
# This graph looks nicer as R rather than IDE. The anti-aliasing makes it hard to read.

# You can also color the lines by supplying color args to geom_smooth.
ggplot(data = mpg2, aes(displ, hwy)) + geom_point() + geom_smooth(aes(color = drv), method = "lm") +
  facet_grid(cyl ~ drv, margins = T)


# Faceting can be done on a lot of graph types including boxplots.
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
df <- ToothGrowth
head(df)

ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose))

ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose)) +
  facet_grid(supp ~ .)

ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose)) +
  facet_grid(. ~ supp)

ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose)) +
  facet_grid(dose ~ supp)

# Can also adjust the scaling. This makes your scale vary though, possibly making bad graphs.
# By default, 'fixed' is used, which gives all graphs the same scale, which can make some graphs
# look really small.
# See here that the top row goes to 20, middle to 24, bottom to 30. It could be misleading.
ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose)) +
  facet_grid(dose ~ supp, scales = 'free')

ggplot(df, aes(x = dose, y = len, group = dose)) + geom_boxplot(aes(fill = dose)) +
  facet_wrap(dose ~ supp, scales = 'free')


# geom_path exists. Not sure why but I guess it looks nice?
# Declare a dummy data frame.
df <- data.frame(x = c("a", "a", "a", "a", "b", "b", "b", "b"),
                 y = c(1, 2, 3, 4, 4, 3, 2, 1),
                 z = c("A", "A", "B", "B", "B", "B", "A", "A"))

ggplot(data = df, aes(x, y, color = z)) +
  geom_point() +
  geom_path()

# As above but grouped as one.
ggplot(data = df, aes(x, y, color = z)) +
  geom_point() +
  geom_path(aes(group = 10))

# As above but grouped by z.
ggplot(data = df, aes(x, y, color = z)) +
  geom_point() +
  geom_path(aes(group = z))


