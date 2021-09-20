server <- function(input, output, session){
  
  team_df <- reactive({
    get_team_ma_scores(
      df = EPL,
      team = input$team,
      ma = c(input$ma1, input$ma2)
    )
  })
  
  output$crossover_plot <- renderPlotly(
    create_crossover_plot(
      df = team_df(),
      metric = input$metric,
      team = input$team
    )
  )
  
  sever(opacity = 0.85)
  
}