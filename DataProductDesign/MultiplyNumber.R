library(shiny)
library(miniUI)

MultiplyNumber <- function(number1,number2){
  ui <- miniPage(
    gadgetTitleBar("Multiply two numbers"),
    miniContentPanel(
      selectInput("num1","First number",choices = number1),
      selectInput("num2","Second number",choices = number2)
    )
  )
  
  server <- function(input, output, server){
    observeEvent(input$done, {
      num1<- as.numeric(input$num1)
      num2 <- as.numeric(input$num2)
      stopApp(num1*num2)
    })
  }
  runGadget(ui,server)
}