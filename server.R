library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # Find out what dataset user chose and return it 
  datasetInput <- reactive({
    switch(input$datasets,
           "mtcars" = mtcars,
           "iris" = iris,
           "ToothGrowth" = ToothGrowth)
  })
  
  # Generate summary of the selected output
  output$summary <- renderPrint({
    dataset <- datasetInput() 
    summary(dataset)
  })
  
  # Show off # of observation user chose to display 
  output$view <- renderTable({
    head(datasetInput(), n = input$samples)
  })
  
})
