ui <- function(){
  navbarPage(
    title = "English Premier League",
    theme = shinytheme("slate"),
    tabPanel(
      title = "Moving Average Crossover",
      wellPanel(
        fluidRow(
          useSever(),
          column(
            width = 3,
            selectInput(
              "team",
              label = "Select a team",
              choices = teams,
              selected = teams[1]
            )
          ),
          column(
            width = 3,
            selectInput(
              "metric",
              label = "Select a metric",
              choices = c("Point", "Goal", "Goal_against", "Goal_dif"),
              selected = "Point"
            )
          ),
          column(
            width = 3,
            numericInput(
              "ma1",
              label = "Length of moving average #1",
              value = 10L,
              min = 2L,
              max = 30L
            )
          ),
          column(
            width = 3,
            numericInput(
              "ma2",
              label = "Length of moving average #2",
              value = 50L,
              min = 10L,
              max = 100L
            )
          )
        )
      ),
      plotlyOutput("crossover_plot") %>% withSpinner()
    )
  )
}