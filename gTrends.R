library(tidyverse)    # combination of packages
library(knitr)

setwd("/Users/paul/OneDrive/github") 
getwd()

data <- read.csv('gTrends.csv')
head(data); tail(data)

gTrend<-ggplot() + geom_line(aes(x=year,y=cumsum(count),color='HR analytics'),data %>% filter(query=='HR Analytics')) +
  geom_line(aes(x=year,y=cumsum(count), color='People analytics'),data %>% filter(query=='People Analytics')) +
  geom_line(aes(x=year,y=cumsum(count), color='Workforce analytics'),data %>% filter(query=='Workforce Analytics')) 
  
gTrendchart <- gTrend + 
  ggtitle("Google searches (cumulative since 2014)") + 
  theme(
  legend.position="bottom",   
  legend.title = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank()) 

gTrendchart
