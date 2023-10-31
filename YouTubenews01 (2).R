# Sample program for using tuber to collect YouTube data
# Packages: tuber, tidyverse, lubridate, stringi, wordcloud, gridExtra, httr
# Website: https://cran.r-project.org/web/packages/tuber/vignettes/tuber-ex.html
# 
install.packages("tuber")

library(tuber)
library(tidyverse)
library(lubridate)
library(stringi)
library(wordcloud)
library(gridExtra)
library(httr)


## Be sure to get the correct credentials
## Create a project for web application
## https://console.developers.google.com
## 1. Enable APIs and services
## 2. Choose YouTube Data API v3

# = Autenthication = #
# 
# 
yt_oauth("YourClientID","YourClientSecret", token = "")

yt_israelprotest = yt_search(term = "Israel protest")

# List of categories (region filter: US)
videocat_us= list_videocats(c(region_code = "us"))
# = Download and prepare data = #
mostpop = list_videos()

mostpop_us = list_videos(video_category_id = "25",   region_code = "US", max_results = 10)


# Find the channel ID in the source page
# Alternatively, from get_video_details
# = Channel stats = #

nbcnews_stat = get_channel_stats("UCeY0bbntWzzVIaj2z3QigXg")
nbcnews_detail = get_video_details(video_id = "to0YqKKRIWY")



# = Videos = #
curl::curl_version()
httr::set_config(httr::config(http_version = 0)) # Fix curl issue

nbc_videos1 = yt_search(term="", type="video", channel_id = "UCeY0bbntWzzVIaj2z3QigXg")
nbc_videos = nbc_videos1 %>%
  mutate(date = as.Date(publishedAt)) %>%
  filter(date > "2022-11-27") %>%
  arrange(date)
samplecomment = get_comment_threads(c(video_id = "to0YqKKRIWY"), max_results = 600)
samplecomment2 = get_all_comments(c(video_id = "to0YqKKRIWY"), max_results = 600)
# = Comments, may take a long time #
nbc_comments = lapply(as.character(nbc_videos1$video_id), function(x){
  get_comment_threads(c(video_id = x), max_results = 101)
})
