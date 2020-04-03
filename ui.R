
shinyUI (pageWithSidebar(
  headerPanel(" Just Another SIR Modeler"),
  sidebarPanel(
    sliderInput(inputId = "time_values", label = "Day", value = c(0, 100), min = 0, max = 300),
    sliderInput(inputId = "beta", label ="Beta", value = 0.55, min = 0.00, max = 1, step = 0.01),
    sliderInput(inputId = "gamma", label ="Gamma", value = 0.44, min = 0.00, max = 1, step = 0.01),
    
    tags$br(), 
    h6("Created by: hcencabo"),
    h6("University of Southeastern Philippines")) ,
  
  mainPanel(
    plotOutput("plot"))
))