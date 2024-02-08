library(ggplot2)

# # Normally very noisy. By using log() we can reduce some noise for a smoother regression (line).
# qplot(carat, price, data = diamonds, geom = "point")
# qplot(log(carat), log(price), data = diamonds, geom = "point")
#
# qplot(carat, price, data = diamonds, geom = "smooth")
# qplot(log(carat), log(price), data = diamonds, geom = "smooth")
#
# # It's also possible to specify multiple geom arguments as a vector.
# qplot(log(carat), log(price), data = diamonds, geom = c("point", "smooth"))

# We can use a randomly selected sample of the dataset for the graph.
# However, because the results should be reproducible, we should set an RNG seed.
set.seed(1000)
# Select the numbered rows of the numbers produced by sample. Sample picks 100 random numbers.
dsmall <- diamonds[sample(nrow(diamonds), 100),]
# The random comma at the end tells R that you're slecting ROWS, not columns.
# If you don't put this column it assumes you're looking to select the columns.

# qplot allows for some extra arguments such as shapes.
qplot(log(carat), log(price), data = dsmall, shape = cut, color = color)

