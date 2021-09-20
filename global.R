source("setup.R")

# This could, and should, be in a reactive environment 
#  if you need the app to run 'live'.
EPL <-
  read_csv("https://www.football-data.co.uk/mmz4281/2122/E0.csv") %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/2021/E0.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/2021/E1.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1920/E0.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1920/E1.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1819/E0.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1819/E1.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1718/E0.csv")) %>%
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1718/E1.csv")) %>%
  mutate(
    Date = dmy(Date),
    HomePoint = case_when(
      FTR == "H" ~ 3L, 
      FTR == "D" ~ 1L, 
      FTR == "A" ~ 0L
    ),
    AwayPoint = case_when(
      FTR == "A" ~ 3L, 
      FTR == "D" ~ 1L, 
      FTR == "H" ~ 0L
    )
  ) %>%
  arrange(Date, Time) %>%
  select(Div, Date, HomeTeam, AwayTeam, FTHG, FTAG, HomePoint, AwayPoint)

teams <- EPL %>% 
  filter(Div == "E0") %>% 
  distinct(HomeTeam) %>% 
  pull() %>% 
  sort()
