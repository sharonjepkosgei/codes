## Workshop: Scraping webpages with R rvest package
# Prerequisites: Chrome browser, Selector Gadget

# install.packages("tidyverse")
library(tidyverse)
# install.packages("rvest")
library(rvest)

url <- 'https://en.wikipedia.org/wiki/List_of_countries_by_foreign-exchange_reserves'
#Reading the HTML code from the Wiki website
wikiforreserve <- read_html(url)
class(wikiforreserve)

## Get the XPath data using Inspect element feature in Safari, Chrome or Firefox
## At Inspect tab, look for <table class=....> tag. Leave the table close
## Right click the table and Copy XPath, paste at html_nodes(xpath =)

foreignreserve <- wikiforreserve %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div/table[1]') %>%
  html_table()
class(foreignreserve)
fores = foreignreserve[[1]]


names(fores) <- c("Rank", "Country", "Forexres", "Date", "Change", "Sources")
colnames(fores)

head(fores$Country, n=10)

## Clean up variables
## What type is Rank?
## How about Date?

# Remove trailing notes in Date variable
library(stringr)
fores$newdate = str_split_fixed(fores$Date, "\\[", n = 2)[, 1]


write.csv(fores, "fores.csv", row.names = FALSE)




