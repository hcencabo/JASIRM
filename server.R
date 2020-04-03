library(deSolve)
library(shiny)

shinyServer (function(input, output) {
  N<-14893318 #population
  SIReq <- function(time, variables, parameters) {
    with(as.list(c(variables, parameters)), {
      dS <- -beta/N * I * S
      dI <-  beta/N * I * S - gamma * I
      dR <-  gamma * I
      return(list(c(dS, dI, dR)))
    })
  }
  
  
  
  sirvalues <- reactive({
    req(input$time_values, input$beta, input$gamma)
    ode(y = c(S = N-1, I = 1, R = 0),
        times = seq(input$time_values[1], input$time_values[2]),
        func = SIReq,
        parms = c(beta = input$beta, gamma = input$gamma))
  })
  
  output$plot <- renderPlot({
    simsir <- as.data.frame(sirvalues())
    
    with(simsir, {
      plot(time, I, type = "l", col = "red", size = 4,
           xlab = "Days", ylab = "Number of Cases")
      lines(time, S, col = "blue")
      lines(time, R, col = "green")
    })
    
    legend("right", c("Susceptibles", "Infections", "Recovered"),
           col = c("blue", "red", "green"), lty = 1, bty = "n")
  })
  
  
})