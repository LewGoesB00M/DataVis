library(shiny)

# Shiny requires a client-server setup, with a file for each.
# This file declares the server backend, which processes client inputs.

# Because everything below is an argument to the shinyUI(pageWithSidebar()) function,
# it must be comma-seperated.

shinyServer(function(input, output) {
  # renderPlot is called when the client updates its input (I think), so by including our
  # graph production within this function, it will be updated dynamically.
  output$distPlot <- renderPlot({
    dist <- rnorm(input$obs)
    hist(dist)
  })
})



