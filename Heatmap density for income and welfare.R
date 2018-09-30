# R Script for the heat map density between average income and average welfare
# in Australia between 2013 to 2016 by states

#load packages
library(tidyverse)

# load data
#check the directory settings
getwd()

setwd("/Users/Justin_Mah/R Studio/STDS")

eda <- read_csv("finaldata.csv")

# Heatmap analysis between average income and welfare in Australia
ggplot(eda,aes(AverageIncome,Averagewelfare))+stat_bin_hex(colour="white")+
  theme_gray()+
  scale_fill_gradient2(low="green",mid="blue" ,high = "orange")+
  scale_x_continuous(labels = comma)+
  scale_y_continuous(labels = comma)+
  facet_wrap(~State.x)+theme(axis.text.x = element_text(angle = 90))+
  labs(x="Average income ($)",y="Average welfare ($)",title="Heatmap analysis between average income and average Welfare in Australia", subtitle="Between 2013 to 2016")
