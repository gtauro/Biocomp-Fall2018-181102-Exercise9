rm(list = ls())  # clears global environment

setwd("~/Biocomp-Fall2018-181102-Exercise9")  # sets working directory to exercise file

library(ggplot2)  # reads in the ggplot2 library

# QUESTION 1

cerealData <- read.csv("cereal.csv")  # reads in file "cereal.csv", which compiles the calories and carbs of 80 different cereals

ggplot(cerealData, aes(x = Calories, y = Carbohydrates)) +  # sets up a ggplot that uses cerealData and its corresponding labels for axes
  geom_point(position = "jitter") +  # makes ggplot a scatterplot, jittered to avoid crowding
  geom_smooth(method = lm, color = "red", se = FALSE) +  # creates a red trendline that runs through the scatterplot, works to show loose positive relationship between calories and carbs
  theme_classic() +  # uses classic theme which removes gridlines
  xlab("Calories (cals)") +
  ylab("Carbohydrates (grams)")


# QUESTION 2

data <- read.table("data.txt", header = TRUE, sep = ",")  # reads in file "data.txt", which compiles different observations from different regions

basePlot <- ggplot(data, aes(x = region, y = observations))  # creates a "base" ggplot to build both bar graph and scatterplot from

basePlot +  # calls on basePlot
  geom_bar(aes(x = as.factor(region), y = observations, fill = region), stat = "summary", fun.y = "mean") +  # makes basePlot a bar graph using data.txt's data and colors according to region, takes means of observations as y values with stat = "summary" and fun.y = "mean"
  theme_classic() +  # uses classic theme which removes gridlines
  xlab("Region") +  # sets x label as "Region"
  ylab("Observations")  # sets y label as "Observations"

basePlot +  # calls on basePlot
  geom_point(aes(x = region, y = observations, color = region), position = "jitter") +  # makes ggplot a scatterplot, using data.txt's data, colored according to region, and jittered to avoid crowding
  theme_classic() +  # uses classic theme which removes gridlines
  xlab("Region") +  # sets x label as "Region"
  ylab("Observations")  # sets y label as "Observations

# The bar graph and the scatterplot show completely different stories that could highly effect how one interprets the data.
# The bar graph shows means that are relatively similar to each other. Because all their means are so close, one could easily assume region is insignificant to the data.
# The scatterplot shows that each region is distributed completely differently:
# East shows a distribution along a "normal" curve,
# North shows a distribution centered around the mean with a small st. dev.
# South shows a distribution that is bimodal, with a tight group around the 5 observations mark and a loose group around the 25 observations mark
# West shows a distribution that is spread out pretty evenly
# If one was to use a figure to understand the data, the scatterplot would be more effective as it tells a more detailed and useful story with its distributions