library(ggplot2)

depth_dist <- ggplot(diamonds, aes(clarity))
depth_dist <- depth_dist + geom_bar(aes(fill = cut), position = "stack")
depth_dist + labs(title = "Diamond clarity by cut", x = "Diamond clarity", y = "Count")
# Bar chart coloured/filled by diamond cut.

depth_dist <- depth_dist + geom_bar(aes(fill = cut), position = "dodge")
# Bar chart with multiple bars of each clarity, each bar for a different cut.


ggplot(diamonds, aes(x, y)) # Empty graph, nothing going on.
# This is because nothing was actually defined - ggplot itself just makes the axes,
# then you'd add something like geom_point() or geom_bar() to populate the graph.

ggplot(diamonds, aes(x, y, color = price)) + geom_point() # Scatter graph coloured by price
ggplot(diamonds, aes(x, y)) + geom_point(aes(color = price)) # Functionally the same.
# A trend line could be added using geom_smooth() but this is extremely resource intensive.
# Or something else was causing an issue that made this lag my laptop.

