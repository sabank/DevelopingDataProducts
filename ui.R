
shinyUI(fluidPage(
  titlePanel("NOAA-based Weather Events Visualizer"),
  
  sidebarLayout(
    position = "right",

    sidebarPanel(
      width = 5,
      helpText("Explore the NOAA Storm Database and reveal human costs from severe weather events in the US between 1950 and 2011"),
      h3("Introduction"),
      p("This visualizer shows the impact on population health along the number of occurrence of severe weather events by state in the US"),
      p("Three types of chart (bubble, bar, line) are available to display the information"),
      h3("Get started"),
      p("For the best experience, where possible, follow the recommendation below"),
      p("* display 'States' on x-axis (i.e. Order-Alphabetical)"),
      p("* display 'Number of occurence' on y-axis (i.e. Occurence)"),
      p("* select 'Log' scale for y-axis"),
      p("* select 'color' for Number of occurence (i.e. Occurrence)"),
      p("* select 'size' for 'Human cost' (i.e. Fatalities)"),
      p("* check on any state to highlight it in the graph"),
      p("* check on 'Trails' if you want to see the trail for any selected state"),
      h3("Run the app"),
      p("* hit 'play' to run the entire session"),
      p("* adjust 'playback speed' for the execution"),
      p("* use 'timeline cursor' to position the view at a particular year"),
      p("* mouse hover the chart/list of states to see feature's attributes")
    ),
    
    mainPanel(
      width = 7,
      htmlOutput("map")
    )
  )
))