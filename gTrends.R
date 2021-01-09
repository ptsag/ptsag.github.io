library(tidyverse)    # combination of packages
library(knitr)

setwd("/Users/paul/OneDrive/github") 
getwd()

data <- read.csv('gTrends.csv')
head(data); tail(data)

gTrend<-ggplot() + geom_line(aes(x=year,y=cumsum(count),color='HR analytics'),data %>% filter(query=='HR Analytics')) +
  geom_line(aes(x=year,y=cumsum(count), color='People analytics'),data %>% filter(query=='People Analytics')) +
  geom_line(aes(x=year,y=cumsum(count), color='Workforce analytics'),data %>% filter(query=='Workforce Analytics')) +
  lims(x= c(2004, 2020), y = c(0, 6000))
  
gTrendchart <- gTrend + 
  ggtitle("'HR analytics' leads search interest (cumulative, by month since 2004)") + 
  geom_point() + labs(caption = "Source: trends.google.com") +
  theme(
  legend.position="bottom",
  legend.title = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank()) 

gTrendchart
