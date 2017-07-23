#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  pop    <- reactive({
    return(rpois(1000, input$prob))
  })
    
    output$histPlot <- renderPlot({
    
    s_means <-     replicate(input$num_samples, mean(sample(pop(), input$sample_size, input$replacement)) )
    plot(density(s_means ), "Sample Mean Density (black) and Normal Curve (blue)")
    curve(dnorm(x, mean=input$prob, sd=input$prob/sqrt(input$sample_size)), 
         col="darkblue", lwd=2, add=TRUE, yaxt="n")
    
  })
  
  output$popPlot <- renderPlot({
    
   plot(density(pop()), main= "Population Density (black) and Normal Curve (blue)", xlim=c(0,20))
   curve(dnorm(x, mean=input$prob, sd=input$prob/sqrt(input$sample_size)), 
          col="darkblue", lwd=2, add=TRUE, yaxt="n")
    
  })
  
})
