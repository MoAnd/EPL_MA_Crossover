source("setup.R")

EPL <- 
  read_csv("https://www.football-data.co.uk/mmz4281/2122/E0.csv") %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/2021/E0.csv")) %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/2021/E1.csv")) %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1920/E0.csv")) %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1920/E1.csv")) %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1819/E0.csv")) %>% 
  bind_rows(read_csv("https://www.football-data.co.uk/mmz4281/1819/E1.csv")) %>% 
  mutate(Date = dmy(Date)) %>% 
  arrange(Date, Time) %>% 
  select(Div, Date, HomeTeam, AwayTeam, FTHG, FTAG)


teams <- EPL %>% 
  filter(Div == "E0") %>% 
  distinct(HomeTeam) %>% 
  pull() %>% 
  sort()
