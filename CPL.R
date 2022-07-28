install.packages("ggplot2")
install.packages("forcats")
library(forcats)
library(ggplot2)
library(ggrepel)

canfutbol <- read.csv("CPL Team Totals 2019.csv")
canfutbol

shots2goals <- (canfutbol$Goal) / (canfutbol$SOG)

CanConversionRate <- data.frame("Name" = canfutbol$team,
                                "Goals" = canfutbol$Goal,
                                "Rate" = shots2goals)    

ggplot(CanConversionRate, aes(x = Goals, y = Rate)) + 
  geom_bar(aes(x = reorder(Goals, Rate), y = Rate, fill = Name), stat = 'identity') +
  theme(axis.text = element_text(size = 5)) +
  ggtitle("Conversion Rate vs Goals Scored")

CanStats <- data.frame("Name" = canfutbol$team,
                       "Rate" = shots2goals,
                       "Goals" = canfutbol$Goal,
                       "ShotsINBx" = canfutbol$SOTInBox,
                       "ShotsOTBx" = canfutbol$SOTOBox,
                       "GoalINBx" = canfutbol$GoalInBx,
                       "GoalOTBx" = canfutbol$GoalOBx,
                       "Shots" = canfutbol$SOG)




ggplot(CanStats, aes(x = Shots, y = Goals)) + 
        geom_point(aes(x = ShotsINBx, y = GoalINBx, colour = Name), 
                   alpha = 1/2, stat = 'identity', size = 4) +
        geom_point(aes(x = ShotsOTBx, y = GoalOTBx, colour = Name),
                   alpha = 1/2, stat = 'identity', size = 4, shape = 15) +
        xlim(30, 110) + ylim(0, 45) + 
        ggtitle("Shots Inside vs Outside the Box") + 
        annotate("text", x = 48, y = 14, label = "Shots Outside the Box", size = 2.5) +
        annotate("text", x = 48, y = 12, label = "(Squares)", size = 2.5) +
        annotate("text", x = 87.5, y = 35, label = "Shots Inside the Box", size = 2.5) +
        annotate("text", x = 87.5, y = 33, label = "(Circles)", size = 2.5)
print("Hello World")



