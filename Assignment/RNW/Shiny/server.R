library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

# This file declares the server backend, which processes client inputs.

dataDf <- read.csv("C:/Users/Lewis/DataspellProjects/DataVis/Assignment/RNW/data/wrangledData.csv")

shinyServer(function(input, output) {
  # Even though it is numeric, the app refuses to run unless I respecify that.
  dataDf$numSize <- as.numeric(dataDf$numSize)

  # Reviews has some values that cause the Y axis to inflate massively.
  tmpData <- dataDf %>% filter(Reviews < 4000000) 


  # Graphs for the histograms page.
  output$histogramOut <- renderPlotly({
    # numSize stores all "Varying with device" sizes as 0.
    # This does not work with histograms.
    histData <- dataDf %>% filter(numSize != 0)

    graph <- ggplot(histData, aes_string(x = input$histX)) +
        geom_histogram(binwidth = input$bins, fill = "cyan")


    if (input$histFacet != "Don't facet") {
      # Doesn't work unless wrapped histFacet is wrapped in a get() call.
      graph <- graph + facet_wrap(~get(input$histFacet), scales = "free_y")
    }

    ggplotly(graph)
  })

  # Graphs for the scatterplot page.
  output$scatterOut <- renderPlotly({
    graph <- ggplot(tmpData, aes_string(x = input$scatterX, y = input$scatterY, color = input$scatterColour)) +
      geom_point() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    ggplotly(graph)
  })

  output$barOut <- renderPlotly({
    graph <- ggplot(dataDf, aes_string(x = input$barX, fill = input$barX)) +
      geom_bar() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    ggplotly(graph)
  })

  output$boxOut <- renderPlotly({
    groupedData <- reactive(dataDf %>%
    # group_by_ is not the same as group_by. Note the underscore at the end.
    # The underscore version works with strings, which is what gets provided by Shiny
    # as opposed to actual names. Therefore, this function converts the
    # input string to a corresponding column of that name. 
    group_by_(xaxis = input$boxX, yaxis = input$boxY))

    graph <- ggplot(groupedData(), aes(x = xaxis, y = yaxis)) +
      geom_boxplot(fill='skyblue') +
      labs(x = input$boxX, y = input$boxY) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    ggplotly(graph)
  })

})