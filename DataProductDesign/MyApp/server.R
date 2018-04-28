#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  model <- reactive({
    brushed_data <- brushedPoints(trees, input$brush1,
                                  xvar = "Girth",yvar = "Volume")
    if(nrow(brushed_data)<2){
      return(NULL)
    }
    lm(Volume ~ Girth,data = brushed_data)
  })

  output$slopeOut <- renderText({
    if(is.null(model())){
      "No slope found"
    }else{
      model()[[1]][2]
    }
  }
  )
  output$intOut <- renderText(
    ifelse(is.null(model()), "No intercept found", model()[[1]][1])
  )
  
  output$plot1 <- renderPlot({
    plot(trees$Girth,trees$Volume,xlab = "Girth",ylab = "Volume"
         ,main = "Tree measurement",cex=1.5,pch=16,bty="n")
    if(!is.null(model())){
      abline(model(),col = "blue",lwd = 2)
    }
  }
  )
  
})
