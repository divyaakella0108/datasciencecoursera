#This ui.R has the code that helps end user to select a month and view the Ozone Trend.
#This app is built based on airquality data.
#First Tab shows the plot, where as second and third plots show the sample & summary of airquality data.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Airquality Data - Ozone"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       radioButtons("month","Select a Month:",
                   c("May" = 5, "June" = 6, "July" = 7, "August" = 8, "September" =9),  selected = 5)
    ),
   
    
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                 
                  tabPanel("plot", br(), plotOutput("distPlot"),textOutput("value")),
                  tabPanel("Summary", br(), tableOutput("out2")),
                  tabPanel("SampleData", br(), tableOutput("out3"))
                 
      )
    )
))
)
