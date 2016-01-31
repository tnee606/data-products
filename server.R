library(shiny)
library(lubridate)
library(ggplot2)

shinyServer(function(input, output) {

  banting <-read.csv("banting1.csv")

  output$plot1 <- renderPlot ({
    filtered.data<-banting[year(banting$Date)==input$year & month(banting$Date)==input$month,]
    ggplot(data=filtered.data, aes(x=Hour, y=API)) +geom_smooth()})


  output$table <- renderDataTable(
    banting, options = list(bFilter = FALSE, iDisplayLength = 50))

})

