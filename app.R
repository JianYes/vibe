library(shiny)

ui <- fluidPage(
  titlePanel("Waiting time Histogram"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30)
    ),

    mainPanel(
      plotOutput("histogram")
    )
  )
)

server <- function(input, output) {
  output$histogram <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    hist(x, breaks = bins, col = "blue", border = "white",
         xlab = "Waiting time (minutes)",
         main = "Distribution of Waiting Times",
         xaxt = "n")
    axis(1, at = seq(45, max(x), by = 5))
  })
}

shinyApp(ui = ui, server = server)
