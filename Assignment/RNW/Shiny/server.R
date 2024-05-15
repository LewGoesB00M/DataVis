library(shiny)

# Shiny requires a client-server setup, with a file for each.
# This file declares the server backend, which processes client inputs.

shinyServer(function(input, output) {

  # renderPlot is called when the client updates its input (I think),
  # so by including our
  # graph production within this function, it will be updated dynamically.

  output$distPlot <- renderPlot({
    dist <- rnorm(input$obs)

    # UI declares that it's sending var 'obs' to server,
    # so it doesn't need to be declared as the server can interpret that via
    # input$obs, which gets the obs column from the input frame. If that
    # doesn't exist through misspelling or some other reason, then you'll
    # get an error.

    hist(dist) # Plot histogram with base R.
  })
})
