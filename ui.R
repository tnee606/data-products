library(shiny)
library(markdown)

shinyUI(navbarPage("Banting Air Pollutant Index 2013-2015",
                   tabPanel("Graph",

                            sidebarLayout(
                              sidebarPanel(
                                helpText("Please choose year and month:"),
                                selectInput(inputId = "year", label = "Select year", choices= c(2013,2014,2015), selected=2014),
                                selectInput(inputId = "month", label = "Select month", choices= c(1,2,3,4,5,6,7,8,9,10,11,12), selected=1)
                              ),


                              mainPanel(
                                h3('API Air Pollutant Index for Banting'),

                                plotOutput("plot1")
                              )
                            )
                   ),
                   tabPanel("Data",
                            mainPanel(
                              dataTableOutput('table')
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
)
)

