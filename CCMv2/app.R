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
            img(src='CCM_eqn.png'),
            # Set drainage times for each pool
            sliderInput("F1", "F1: carbon influx", 
                        min = 1, max = 100, value = 50, step= 1),
            
            sliderInput("F3", "F1: carbon eflux", 
                        min = 1, max = 100, value = 50, step= 1)
        ),
     
    # meant to show number for CCM simple formula
        mainPanel(
            tabsetPanel(
            tabPanel("Model",
                h3('Simple of model of Algal CCM by Sharkey & Berry, 1985'),
                img(src='CCM_fig.png', height = 300, width = 350),
                h2('Model output'),
                span(textOutput("CCM"), style="font-size:30px")
            ),
            tabPanel("Explanation")
            )
        )
    )
)
# Define server logic required to draw a histogram
server <- function(input, output) {

    output$CCM <- renderText({
        paste(HTML("13-C discrimination:"),
        -7.9+27*(input$F3/input$F1)
        )
    })
}    
# Run the application 
shinyApp(ui = ui, server = server)
