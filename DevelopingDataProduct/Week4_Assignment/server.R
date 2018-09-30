#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  options(shiny.sanitize.errors = TRUE)
  
    output$distPlot <- renderPlot({
     
      Data <- airquality[airquality$Month == input$month,]
    plot(Data$Date, Data$Ozone, col = "red", pch = 19, xlab = "Time", ylab = "Ozone")
    
  })
    output$out3 <- renderTable(head(airquality))
    output$out2 <- renderTable(summary(airquality))
    
  
})
