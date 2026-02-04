# Load the required libraries
library(tidyverse)
library(here)
library(gtsummary)

# Load the data and separate out the date components
covid <- read_csv(here("data/data_2023-Jan-12.csv")) %>% 
  mutate(year = year(date),
         month = month(date),
         day = day(date),
         # Label months as a factor with levels in the correct order
         month_lab = factor(month.abb[month], levels = month.abb)
  ) %>% 
  
  # Classify rows into winter/non-winter
  mutate(season = factor(if_else(month_lab %in% c("Dec", "Jan", "Feb"), "Winter", "Non-winter"))) 
