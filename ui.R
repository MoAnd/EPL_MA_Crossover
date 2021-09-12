ui <- function(){
  navbarPage(
    title = "English Premier League",
    theme = shinytheme("slate"),
    tabPanel(
      title = "Moving Average Crossover",
      wellPanel(
        fluidRow(
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
              choices = c("Goal", "Goal_against", "Goal_dif"),
              selected = "Goal"
            )
          ),
          column(
            width = 3,
            numericInput(
              "ma1",
              label = "Length of moving average #1",
              value = 10L,
              min = 2L,
              max = 20L
            )
          ),
          column(
            width = 3,
            numericInput(
              "ma2",
              label = "Length of moving average #2",
              value = 30L,
              min = 10L,
              max = 50L
            )
          )
        )
      ),
      plotlyOutput("crossover_plot") %>% withSpinner()
    )
  )
}