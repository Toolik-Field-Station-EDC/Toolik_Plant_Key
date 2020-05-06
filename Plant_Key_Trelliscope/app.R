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
    
    # App title ----
    titlePanel("Hello trelliscope in Shiny!"),
    
    # Sidebar layout with input and output definitions ----
    fluidPage(
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Histogram ----
            trelliscopeOutput("plot", width = "100%", height = "400px")
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$trello <- renderTrelliscope({
        pok <-
            read_csv("C:/Users/Amanda B. Young/Documents/website/plant_key/plants_web.csv") %>%
            mutate_at(vars(matches("_id$")), as.character)
        pok %>%
            mutate(panel = img_panel(url)) %>%
            trelliscope("Toolik Plant Key", nrow = 3, ncol = 6,
                        state = list(labels = c("Latin", "common")))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
