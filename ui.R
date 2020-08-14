library(shiny)

## Define UI for application that draws a histogram

# shinyUI is the function 
# fluidPage - page type we will use to create UI
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Simple Computations for some Datasets in R"),
    
    # Sidebar layout 
    sidebarLayout(
        # side panel
        sidebarPanel(
            
            # Input: Asking user to select dataset from range of choices
            selectInput(inputId = "datasets",
                        label = "Choose a dataset:",
                        choices = c("mtcars","iris","ToothGrowth")),
            
            # Input: Asking user to select number of samples they want to view
            sliderInput(inputId = "samples",
                        label = "Number of samples:",
                        min = 1, 
                        max = 100, 
                        value = 5)
        ),
        
        # main panel 
        mainPanel(
            
            # label for title of the summary table 
            # Output: Text for data summary 
            h3("Summary Table"),
            verbatimTextOutput("summary"),
            
            # label for the request samples 
            # Output: Table with the requested number of samples 
            h3("Here are the samples requested:"),
            tableOutput("view")
            
        )
    )
))
