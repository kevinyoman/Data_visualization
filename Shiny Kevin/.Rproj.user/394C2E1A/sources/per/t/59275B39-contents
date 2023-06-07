# Untuk menyiapkan lingkungan aplikasi, misalnya, library, impor data dan persiapan data


# --------- LOAD LIBRARIES

# dashboarding
library(shiny)
library(shinydashboard)
library(DT) # datatable

options(scipen = 99) # me-non-aktifkan scientific notation
library(tidyverse) # koleksi beberapa package R
library(plotly) # plot interaktif
library(glue) # setting tooltip
library(scales) # mengatur skala pada plot
library(rsconnect)


# --------- READ DATA 

vids <- read_csv("data_input/youtubetrends.csv", locale=locale(encoding='latin1'))

# --------- DATA PREPARATION

vids_clean <- vids %>% 
  mutate(channel_title = as.factor(channel_title),
         category_id = as.factor(category_id),
         publish_when = as.factor(publish_when),
         publish_wday = as.factor(publish_wday),
         timetotrend = as.factor(timetotrend),
         likes_per_views = likes / views,
         dislikes_per_views = dislikes / views,
         comments_per_views = comment_count / views)
