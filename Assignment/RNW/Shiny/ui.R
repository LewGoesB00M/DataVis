library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

# Shiny requires a client-server setup, with a file for each.
# This file declares the client's UI.

dataDf <- read.csv("C:/Users/Lewis/DataspellProjects/DataVis/Assignment/RNW/data/wrangledData.csv")

# This is split over 6 pages using navbarPage and tabPanels

shinyUI( 
  navbarPage(title = "Data analysis of the Google Play Store dataset",
  # INFO PAGE ---------------------------------------------------------------------------------
  tabPanel("Info",
  
  p("This is the Shiny webapp to accompany my CMP5352 Assignment 2 report."), 

  p("Within this web app, you can produce graphs from the dataset used within the report."),

  p("The app is split over five 'tabPanels', as you can see at the top of this page.
  Each one of these panels is a generator for different types of graph."),

  p("The graphs shown are all generated with plotly, which means that you can use your mouse to hover
  over data points, and also use functionalities like zooming in and panning around the graphs."),

  a("The dataset used in the report can be found here.", href = "https://www.kaggle.com/datasets/lava18/google-play-store-apps/data")

  ),
  # HISTOGRAMS ----------------------------------------------------------------------------------------
  tabPanel("Histograms",
    
    headerPanel("Histogram generator"),
    

    
    # Sidebar, where users give input.
    sidebarPanel(
      selectInput(
        inputId = "histX",
        label = "X-axis:",
        choices = c(
          "Size" = "numSize",
          "Review score" = "Rating"
          
          
          ),
        selected = "numSize"
      ),
      
      selectInput(
        inputId = "histFacet",
        label = "Facet by:",
        choices = c(
          "Don't facet", 
          "Install thresholds" = "installThresholds"
        ),
        selected = ""
      ),
      
      sliderInput(
        inputId = "bins",
        label = "Bin width",
        min = 0.1,
        max = 50,
        step = 0.1, # Ratings go in decimals.
        value = 1
        )
      
      
    ),
    
    # Main panel to output a graph.
    mainPanel(
      plotlyOutput("histogramOut")
    )
  ),
  # SCATTERS ---------------------------------------------------------------------------------
  tabPanel("Scatterplots",
    
    headerPanel("Scatterplot generator"),
    

    
    # Sidebar, where users give input.
    sidebarPanel(
      selectInput(
        inputId = "scatterX",
        label = "X-axis:",
        choices = c(
          "Rating", "Reviews (under 4 million)" = "Reviews",
          "Size" = "numSize",
          "Required Android version" = "numVer"
        ),
        selected = "numSize"
      ),
      
      selectInput(
        inputId = "scatterY",
        label = "Y-axis:",
        choices =c(
          "Rating", "Reviews (under 4 million)" = "Reviews",
          "Size" = "numSize",
          "Required Android version" = "numVer"
        ),
        selected = ""
      ),

      selectInput(
        inputId = "scatterColour",
        label = "Colour by:",
        choices = c(
          "Size thresholds" = "sizeThresholds",
          "Install thresholds" = "installThresholds",
          "Required Android version" = "Android.Ver",
          "Type of app (Free, Paid)" = "Type",
          "Category" # Doesn't need to be assigned to something else,
          # because it's the name of the column as well as the selection.
        ),
        selected = "Type"
      )
      
      
    ),
    
    # Main panel to output a graph.
    mainPanel(
      plotlyOutput("scatterOut")
    )
  ),
  # BARS ----------------------------------------------------------------------------------------------
    tabPanel("Bar charts",
    
    headerPanel("Bar chart generator"),
    

    
    # Sidebar, where users give input.
    sidebarPanel(
      selectInput(
        inputId = "barX",
        label = "X-axis:",
        choices = c(
          "Install thresholds" = "installThresholds",
          "Size thresholds" = "sizeThresholds",
          "Required Android version" = "numVer",
          "Content rating" = "Content.Rating"
        ),
        selected = "numSize"
      ),

      
    ),
    
    # Main panel to output a graph.
    mainPanel(
      plotlyOutput("barOut")
    )
  ),
  # BOXPLOTS ----------------------------------------------------------------------
    tabPanel("Boxplots",
    
    headerPanel("Boxplot generator"),
    

    
    # Sidebar, where users give input.
    sidebarPanel(
      selectInput(
        inputId = "boxX",
        label = "X-axis:",
        choices = c(
          "Install thresholds" = "installThresholds",
          "Size thresholds" = "sizeThresholds",
          "Required Android version" = "numVer",
          "Content rating" = "Content.Rating"
        ),
        selected = "numSize"
      ),

      selectInput(
        inputId = "boxY",
        label = "Y-axis",
        choices = c(
          "Average rating" = "Rating",
          "Average size" = "numSize"
        ),
        selected = "Rating"
      )
    ),
    
    # Main panel to output a graph.
      mainPanel(
        plotlyOutput("boxOut")
      )
    ),
  )
 
)