Quiz 3library(ggplot2)

# Faceted diamonds scatterplot, carat, cut, price and color. With altered labels.
ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(color = cut)) +
  labs(x = "Price", y = "Carat") + # Color label isn't altered in the image.
  facet_grid(color ~ cut)

# Graphs from random data
df <- data.frame(
  x = rnorm(120, c(0, 2, 4)),
  y = rnorm(120, c(1, 2, 1)),
  z = letters[1:3])

# Graph 1 - Size and scale
ggplot(df, aes(x, y)) +
  geom_point(size = 3, aes(color = z)) +
  scale_x_continuous(breaks = c(-2, 0, 2, 4, 6)) +
  scale_y_continuous(breaks = c(-1, 0, 1, 2, 3, 4))

# Graph 2 - Faceting & Labelling
ggplot(df, aes(x, y)) +
  geom_point(size = 3, aes(color = z)) +
  scale_x_continuous(breaks = c(-2, 0, 2, 4, 6)) +
  scale_y_continuous(breaks = c(-1, 0, 1, 2, 3, 4)) +
  labs(x = "X", y = "Y", color = "Z") +
  facet_grid(. ~ z)