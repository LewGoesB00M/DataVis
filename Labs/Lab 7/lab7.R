# Lab 7 - Scales, axes and legends
library(ggplot2)

# These lines do exactly the same thing.
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class))

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_continuous() + scale_y_continuous() + scale_color_discrete()

# This is to reduce tedium when producing graphs, though as you did in your 5353 assessment,
# you can modify these as such.

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_continuous("X axis") + scale_y_continuous("Y Axis")
# Adding multiple labels to the SAME axis will just overwrite the first one, so don't do that.

# There are different kinds of scales, too.
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_sqrt() + scale_color_brewer()
# scale_[AXIS]_[TYPE]()

# Testing DF
df <- data.frame(x = 1:2, y = 1, z = "a")

# You can produce some more interesting looking scales using quote().
ggplot(df, aes(x, y)) + geom_point() +
  scale_x_continuous(quote(A + Mathematical ^ Expression))

# If you're looking to just use the default scale, you can quickly change the label of it as such.
ggplot(df, aes(x, y)) + geom_point(aes(color = z)) +
  xlab("X axis") + ylab("Y axis")

# Alternatively, supply all labels at once via labs().
ggplot(df, aes(x, y)) + geom_point(aes(color = z)) +
  labs(x = "X axis", y = "Y axis", color = "Colour\nlegend") # \n is supported.

# You can entirely remove a label by making it a blank string or NULL.
# Making it a blank string will still leave space for where it should be, whereas NULL will leave none.
ggplot(df, aes(x, y)) + geom_point(aes(color = z)) +
  labs(x = NULL, y = NULL) # No space at all

ggplot(df, aes(x, y)) + geom_point(aes(color = z)) +
  labs(x = "", y = "") # Small amount of space.

# Breaks can be used to set specific points on the axis (the breaks) to show.
# Any custom labels you add must be of the same length as your breaks. 2 breaks means 2 labels.
df <- data.frame(x = c(1, 3, 5) * 1000, y = 1)
ggplot(df, aes(x, y)) + geom_point() +
  labs(x = NULL, y = NULL) +
  scale_x_continuous(breaks = c(2000, 4000), labels = c("2k", "4k"))

# Here's an example of where you might want custom labels for categorical variables.
df2 <- data.frame(x = 1:3, y = c("a", "b", "c"))
ggplot(df2, aes(x, y)) +
  geom_point() # a, b, and c are quite non-descript, so let's change them for better viewing.

ggplot(df2, aes(x, y)) +
  geom_point() +
  scale_y_discrete(labels = c("Apple", "Banana", "Carrot"))
# Discrete scale because these are categorical.

# You can completely hide breaks and labels by making them null.
# This will also hide the grid lines for the axis you hid.
ggplot(df2, aes(x, y)) +
  geom_point() +
  scale_x_continuous(breaks = NULL) +
  scale_y_discrete(breaks = NULL) # Obviously you wouldn't hide both.

# You can make some nice looking plots with colours.
# You can copy the format (black outline circle) to the legend via show.legend = T/TRUE
df <- data.frame(x = 1:3, y = 1:3, z = c("a", "b", "c"))
ggplot(df, aes(y, y)) +
  geom_point(size = 4, colour = "grey20", show.legend = TRUE) +
  geom_point(aes(colour = z), size = 2)

# You can get more specific control over the legend and the colours it shows with guide functions.
df <- data.frame(x = 1, y = 1:3, z = 1:3)
ggplot(df, aes(x, y)) + geom_tile(aes(fill = z)) # All one gradient, somewhat hard to discern.

ggplot(df, aes(x, y)) + geom_tile(aes(fill = z)) +
  scale_fill_continuous(guide = guide_legend()) # More seperated colours.

ggplot(df, aes(x, y)) + geom_tile(aes(fill = z)) +
  scale_fill_continuous(guide = guide_legend(ncol = 2)) # Across multiple columns.

# You can set limits to your scales, which is greatly helpful for showing a specific RANGE.
df <- data.frame(x = 1:3, y = 1:3)

ggplot(df, aes(x, y)) + geom_point() +
  scale_x_continuous(limit = c(1.5, 2.5)) # Show between 1.5 and 2.5 on X
# This seems to show a warning to let you know that you hid some rows with this.

ggplot(df, aes(x, y)) + geom_point() +
  scale_x_continuous(limit = c(0, 4)) # Larger range than the default, zooms out more.

# As with labels, these are quickly modified by xlim and ylim.
ggplot(df, aes(x, y)) + geom_point() +
  xlim(c(0, 4))

# Don't be put off by this block of code.
# This is showing all three "types" of scaling: comma, percent, and dollar.
# They add the respective thing to the scale - dollar adds $ sign, percent %, comma puts commas
# to seperate thousands.
df <- data.frame(xaxis = rnorm(50, 100000, 50000),
                 yaxis = runif(50, 0, 1),
                 pointsize = rnorm(50, 1000, 1000))

ggplot(df, aes(x = xaxis, y = yaxis, size = pointsize)) +
  geom_point(color = "cornflowerblue",
             alpha = .6) +
  scale_x_continuous(label = scales::comma) +
  scale_y_continuous(label = scales::percent) +
  scale_size(range = c(1,10), # point size range
             label = scales::dollar)

# If your scale is a date (and R recognises it as such), it complicates it a bit, as there are
# more specific formats for them, as follows:
# %d - Numerical day (1 - 31), %a - Abbreviated weekday (Mon, Tue), %A - Unabbreviated (Monday),
# %m - Numerical month (0 - 12), %b - Abbreivated month (Jan, Feb), %B - Unabbreivated (January),
# %y - 2-digit year (19, 84), %Y - 4-digit year (2019, 1984)

# If you're working with very old data, a 2 digit year option isn't optimal.

# date_breaks takes words as its argument. "2 weeks", "3 months", "4 years"
# date_labels takes the aforementioned formats %d, %a etc.
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line(color="darkgreen") +
  scale_x_date(date_breaks = "5 years",
               date_labels = "%b-%y") #

# To assign colours to categorical variables, you can use manual scales.
ggplot(diamonds, aes(x = cut, fill = clarity)) +
  geom_bar() +
  scale_fill_manual(values = c(
    "darkred", "steelblue", "darkgreen", "gold",
    "brown", "purple", "grey", "khaki4"
  ))

# When we want to show a gradient of colours to represent values, this can be customised with
# scale_color_gradient and scale_color_gradient2.

df <- data.frame(
  x = runif(100), # 100 uniformly distributed random values
  y = runif(100), # 100 uniformly distributed random values
  z1 = rnorm(100), # 100 normally distributed random values
  z2 = abs(rnorm(100)) # 100 normally distributed random values mapped to positive
)

# Normally, it uses a blue gradient that doesn't look great.
ggplot(df, aes(x, y)) +
  geom_point(aes(color = z2))

# The standard gradient function just changes the colors of this gradient.
ggplot(df, aes(x, y)) +
  geom_point(aes(color = z2)) +
  scale_color_gradient(low = "greenyellow", high = "forestgreen")

# gradient2 lets you use a more diverging palette.
ggplot(df, aes(x, y)) +
  geom_point(aes(color = z1), size = 3) +
  scale_color_gradient2(low = 'blue', mid = 'white', high = 'red')
# Your gradient should ideally use two opposite colors on the color wheel for clarity.


# Bonus unnecessary tidbit, "rm(list=ls())" clears all objects from memory.