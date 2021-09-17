get_team_ma_scores <- function(df, team, ma = c(10L, 50L)) {
  #' Get Team Moving Average Scores
  #' 
  #' Function to filter out a given teams' scores and calculate 
  #' moving averages of these scores.  
  #' 
  #' @param df Dataframe containing the EPL scores data.
  #' @param team string. The name of the team.
  #' @param ma numeric. A vector of length two containing the length of the moving averages.
  #' 
  #' @author Morten Andersen
  
  first_ma_slide  <- timetk::slidify(mean, .period = ma[1], .align = "right")
  second_ma_slide <- timetk::slidify(mean, .period = ma[2], .align = "right")
  
  ll <- list()
  ll[[paste0("MA", ma[1])]] <- first_ma_slide
  ll[[paste0("MA", ma[2])]] <- second_ma_slide
  
  df %>% 
    filter(
      str_detect(HomeTeam, pattern = team) | 
        str_detect(AwayTeam, pattern = team)
    ) %>% 
    mutate(
      Goal = if_else(HomeTeam == team, FTHG, FTAG),
      Goal_against = if_else(HomeTeam == team, FTAG, FTHG),
      Goal_dif = Goal - Goal_against,
      Point = if_else(HomeTeam == team, HomePoint, AwayPoint)
    ) %>% 
    select(-FTHG, -FTAG, -HomePoint, -AwayPoint) %>% 
    mutate(across(starts_with(c("Goal", "Point")), .fns = ll))
}

# df <- get_team_ma_scores(df = EPL, team = "Man United")
