#Header: Module 5 script to practice github

#Libraries
library(ggplot2)

#Functions

#Load Data
mers <- read.csv('cases.csv')

#Analysis
mers$hospitalized[890] <- c('2015-02-20')
mers <- mers[-471,]
library(lubridate)
mers$onset2 <- ymd(mers$onset)
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)
day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0)
ggplot(data=mers) + 
  geom_bar(mapping=aes(x=epi.day, fill=country),position = "fill") +
  labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date of symptom onset',
       caption="Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")
