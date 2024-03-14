library(ggplot2)

# Set seed for reproducibility
set.seed(123)
# Sample 100 diamonds
diamonds_sample <- diamonds[sample(nrow(diamonds), 100), ]

# Scatter with colour by cut
ggplot(data = diamonds_sample, aes(carat, price)) +
  geom_point(aes(color = cut)) +
  geom_smooth()

# Boxplot, price by colour
ggplot(data = diamonds_sample, aes(color, price)) +
  geom_boxplot(aes(color = color))
            # Color argument is optional but looks nice

# Facet plot with cut and color
ggplot(data = diamonds_sample, aes(carat, price)) +
  geom_point(aes(color = cut)) +
  geom_smooth() +
  facet_grid(. ~ color)
