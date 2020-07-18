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
    titlePanel("Simple interactive model of an algal CCM"),
    
    # Sidebar with a slider input for model parameters and image of equation 
    sidebarLayout(
        sidebarPanel(
            h4('Set model parameters below'),
            img(src='CCM_eqn.png'),
            # Set paramrters for input into the equation
            sliderInput("F1", "Carbon influx (F1)", 
                        min = 1, max = 100, value = 50, step= 1),
            
            sliderInput("F3", "Carbon leakage (F3)", 
                        min = 1, max = 100, value = 50, step= 1),
            h4('Fixed paramters:'),
            h5('b3 = intrinsic discrimination by rubisco'),
            h5('d = the discrimnation by conversion to bicarbonate')
            
        ),
     
    # Main panel set up
        mainPanel(
            
            #Setting up to have tabs in the main panel
            tabsetPanel(
            
                #Tab 1 displays the model and the output    
            tabPanel("Model",
                h3('Model of Algal CCM by Sharkey & Berry, 1985'),
                img(src='CCM_fig.png', height = 300, width = 350),
                h4('Model output'),
                span(textOutput("CCM"), style="font-size:30px") #'CCM' is the name of the output from the server
            ),
            
            #Tab two will have an explation
            tabPanel("Explanation")
            )
        )
    )
)
# Define server logic required to calculate the C13 discrimination
server <- function(input, output) {
     
    #Output is called CCM to match ui textOutput 
    output$CCM <- renderText({
        
        #add '13-C discr... before the output
        paste(HTML("13-C discrimination:"),
              
         #Equation from Sharkey&Berry(1985), d and b3 given as numbers     
        -7.9+27*(input$F3/input$F1)          
        )
    })
}    
# Run the application 
shinyApp(ui = ui, server = server)
