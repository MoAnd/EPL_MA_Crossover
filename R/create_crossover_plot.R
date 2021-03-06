create_crossover_plot <- function(df, metric, team) {
  #' Create Moving Averages Crossover Plot
  #' 
  #' Function to prepare the data based on selections and
  #' then create the moving averages crossover plot. 
  #' 
  #' @param df Dataframe containing a team's moving average scores.
  #' @param metric string. The type of metric to show.
  #' @param team string. The name of the team.
  #' 
  #' @author Morten Andersen
  
  p <- na.omit(df) %>% 
    select(Date, starts_with(metric)) %>%
    pivot_longer(cols = starts_with(paste0(metric, "_MA")),
                 names_to = "type",
                 values_to = "Value") %>%
    ggplot(aes(x = Date, y = Value, col = type)) +
    ggtitle(paste(team, metric, sep = " - ")) +
    geom_path() +
    theme_classic()
  
  plotly::ggplotly(p)
}

# create_crossover_plot(df = df, metric = "Goal_dif", team = "Man United")
