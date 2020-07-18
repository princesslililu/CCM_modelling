#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Parameters"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h4('Set Models Parameter Below'), 
            # Set drainage times for each pool
            sliderInput("F1", "F1: carbon influx", 
                        min = 1, max = 100, value = 50, step= 1),
            
            sliderInput("F3", "F1: carbon eflux", 
                        min = 1, max = 100, value = 50, step= 1)
        ),
     
    # meant to show number for CCM simple formula
        mainPanel(
            span(textOutput("CCM"), style="color:red")
        )
        
    )
)
# Define server logic required to draw a histogram
server <- function(input, output) {

    output$CCM <- renderText({
        -7.9+27*(input$F3/input$F3)
    })
}    
# Run the application 
shinyApp(ui = ui, server = server)
