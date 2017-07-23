

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Central Limit Theorem Simulation: Poisson Distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2("Control the event rate for a population of 1000"),
      numericInput("prob",
                   "Event rate",
                   min=1,
                   max=100,
                   value = 1,
                   step=1
      ),
      h2("Control the Sample"),
      numericInput("num_samples", 
                   "Number of samples",
                   value = 10,
                   min=1,
                   max=1000),
       sliderInput("sample_size",
                   "Sample Size",
                   min = 1,
                   max = 50,
                   value = 1),
      checkboxInput("replacement", 
                    "Sample with Replacement",
                    value = TRUE),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Graph of sample means"),
       plotOutput("histPlot"),
      h2("Graph of population"),
      plotOutput("popPlot")
    )
  )
))
