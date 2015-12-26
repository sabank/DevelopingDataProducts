
shinyUI(fluidPage(
  titlePanel("NOAA-based Storm Events Visualizer"),
  
  sidebarLayout(
    position = "right",

    sidebarPanel(
      width = 6,
      helpText("Explore the NOAA Storm Database and reveal human costs from severe weather events in the US between 1950 and 2011"),
      h3("Introduction"),
      p("This visualizer shows the impact on population health along the number of occurence of severe weather events by States in the US"),
      p("Three types of graph (bubble, bar, line) are available to display the information"),
      h3("Getting started"),
      p("For the best experience, where possible, follow the recommendation below"),
      p("* display 'States' on x-axis (select:'Order-Alphabetical')"),
      p("* display 'Number of occurence' on y-axis (select:'evfreq' with 'log')"),
      p("* select 'color' for Number of occurence (i.e. evfreq)"),
      p("* select 'size' for 'Human cost' (i.e. humdmg)"),
      p("* check on any state to highlight it in the graph"),
      p("* check on 'Trails' (default) if you want to see the trail for any selected state"),
      h3("Running the app"),
      p("* hit the 'play' button to run the entire session"),
      p("* select the speed of execution with the 'playback speed' cursor"),
      p("* alternatively, use the timeline cursor to position the view at a particular year"),
      p("* mouse hover the graph to see features attributes")
    ),
    
    mainPanel(
      width = 6,
      htmlOutput("map")
    )
  )
))