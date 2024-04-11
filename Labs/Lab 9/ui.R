library(shiny)

# Shiny requires a client-server setup, with a file for each.
# This file declares the client's UI.

# Because everything below is an argument to the shinyUI(pageWithSidebar()) function,
# it must be comma-seperated.

shinyUI(pageWithSidebar(
  # Title
  headerPanel("Shiny example"),

  # Sidebar, where users give input.
  sidebarPanel(
    sliderInput("obs",
                "Number of observations",
                min = 1,
                max = 50,
                value = 30
    )
  ),

  # Main panel to output a graph.
  mainPanel(
    plotOutput("distPlot")
  )

))