library(shiny)

shinyUI(fluidPage(
  titlePanel("Mtcars Data Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      # Documentation for the user
      h3("How to use this app:"),
      helpText("1. Select a vehicle attribute from the dropdown menu."),
      helpText("2. Adjust the slider to change the number of histogram bins."),
      helpText("The app will automatically calculate the mean and redraw the plot based on your inputs."),
      br(),
      
      # Widgets
      selectInput("var", "Choose a variable:", choices = names(mtcars)),
      sliderInput("bins", "Number of bins:", min = 5, max = 20, value = 10)
    ),
    
    mainPanel(
      # Reactive outputs
      plotOutput("distPlot"),
      h4(textOutput("meanText"))
    )
  )
))