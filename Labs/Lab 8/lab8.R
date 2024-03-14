# Lab 8 - Plotly for interaction
library(ggplot2)
library(plotly)

# From brief experimentation, this looks infinitely better than ggplot.
# You can mouse over the graph to view the row represented there.
# However, you obviously can't make it interactive on a PDF, so this is for your Shiny app.

# They take a while to produce.

plot_ly(diamonds, x = ~cut, y = ~clarity) # No trace type warning but it does work.
# (he said this doesn't work but it actually does. likely to do with the ~ symbol.)
# Use it as ggplotly anyway bc it'll hide that warning and is likely the intended use.

p <- ggplot(diamonds, aes(x = log(price), color = clarity)) +
  geom_freqpoly()

ggplotly(p)

# Previous things like faceting still work here.
p <- ggplot(diamonds, aes(x = log(price), color = clarity)) +
  geom_freqpoly(stat = "density") +
  facet_wrap(~cut)

ggplotly(p)

# Some Lab 7 code but in plotly this time.
# My understanding is that you can wrap any ggplot within this and it'll use plotly instead and work.
ggplotly(
    ggplot(diamonds, aes(x = cut, fill = clarity)) +
      geom_bar() +
      scale_fill_manual(values = c(
        "darkred", "steelblue", "darkgreen", "gold",
        "brown", "purple", "grey", "khaki4"
      ))
)

ggplotly(
  ggplot(df, aes(x, y)) +
           geom_point(aes(color = z1), size = 3) +
           scale_color_gradient2(low = 'deeppink', mid = 'white', high = 'aquamarine4')
)

# As much as this is a correct implementation and EXACTLY THE SAME AS USING A VARIABLE,
# he probably wants you to wrap the ggplot in a variable and call ggplotly on the variable.