## Workshop: Scraping webpages with R rvest package
# Prerequisites: Chrome browser, Selector Gadget

# install.packages("tidyverse")
library(tidyverse)
# install.packages("rvest")
url1 = "https://www.imdb.com/search/title/?release_date=2022-01-01,2023-01-01"
imdb2022 <- read_html(url1)
rank_data_html <- html_nodes(imdb2022,'.text-primary')
rank_data <- as.numeric(html_text(rank_data_html))
head(rank_data, n = 10)
title_data_html <- html_nodes(imdb2022,'.lister-item-header a')
title_data <- html_text(title_data_html)

head(title_data, n =20)




