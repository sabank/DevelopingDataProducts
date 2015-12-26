library(shiny)
library(googleVis)

humcost <- read.csv("./data/humcost.csv",header = TRUE)

shinyServer(
  function(input, output) {
    output$map <- renderGvis({
      gvisMotionChart(humcost,idvar="STATE",timevar="bgnyear")
    })
  }
)
