#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(dplyr)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Violent Crime in Households with Children"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput("severity", "Severity of crime:", 
                    choices=c("Serious violent crime",
                              "Simple assault")),
        selectInput("gender", "Gender of head of household:", 
                    choices=c("Female", "Male")),
        actionButton(inputId="go", label = "Plot")
      ),
     
      mainPanel(
        h3("Estimated stats for 2000-2012 by race of head of household (violence against individuals aged 12 and older)"),
        plotlyOutput("plot", width = "100%", height = "400px"),
        p(
          class = "text-muted",
          paste("Caveat: Figures don't represent actual incidence numbers but are",
                " extrapolations from a sampling of respondents, weighted ",
                "to represent the wider U.S. population. Data is from the ",
                "National Crime Victimization Survey via data.gov. Interpret with ",
                "care. Many of the numbers reported for black male-headed households, for example, were derived from 10 ",
                "or fewer records. Data for Asian/Pacific Islander, Native American, ",
                "and mixed-race households is not plotted here since it didn't appear ",
                "to pass even the lowest standards for accuracy."
          ))
      )
   )

)


server <- function(input, output) {
  
  df3 <- read.csv("violence.csv")
  #selectedData <- reactive({
  #data1 <- reactive({
   # df3 <- filter(df3, Sex==input$gender)
   # df3 <- filter(df3, Type.of.violent.crime==input$severity)})

  
   output$plot <- renderPlotly({
     input$go
     isolate(
     plot_ly(filter(df3, Sex==input$gender & Type.of.violent.crime==input$severity), x=~Year, y=~Count, type = "bar", 
             color =~as.factor(Race.ethnicity))
     #%>%
      # layout(barmode="stack")
     )
   })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

