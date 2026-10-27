library(shiny)

shinyServer(function(input, output) {
  
  # Reactive plot output
  output$distPlot <- renderPlot({
    # Extract the selected column
    x <- mtcars[, input$var]
    # Generate bins based on input slider
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = 'steelblue', border = 'white',
         xlab = input$var, main = paste("Histogram of", input$var))
  })
  
  # Reactive calculation output
  output$meanText <- renderText({
    val <- mean(mtcars[, input$var])
    paste("The calculated mean for", input$var, "is:", round(val, 2))
  })
})