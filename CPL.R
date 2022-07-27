install.packages("ggplot2")
library(ggplot2)

canfutbol <- read.csv("CPL Team Totals 2019.csv")
canfutbol

shots2goals <- (canfutbol$Goal) / (canfutbol$SOG)

CanConversionRate <- data.frame("Name" = canfutbol$team, 
                                "Rate" = shots2goals)    

ggplot(CanConversionRate, aes(y = Rate)) + 
  geom_bar(aes(x = Name, fill = Name), stat = 'identity') +
  theme(axis.text = element_text(size = 5))

CanStats <- data.frame("Name" = canfutbol$team,
                       "Rate" = shots2goals,
                       "GoalsScored" = canfutbol$Goal,
                       "ShotsINBx" = canfutbol$SOTInBox,
                       "ShotsOTBx" = canfutbol$SOTOBox,
                       "Shots" = canfutbol$SOG)

ggplot(CanStats, aes(x = GoalsScored, label = Name)) + 
  geom_point(aes(y = Shots), color = "green") +
  geom_point(aes(y = ShotsINBx), color = "red") + 
  geom_point(aes(y = ShotsOTBx), color = "blue")



