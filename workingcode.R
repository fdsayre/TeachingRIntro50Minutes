###############
# Jan 15, 2019
# Teaching Intro to R in 70 Minutes
###############


################
# Exploring the interface ------------
# - Why I am using this document?
# - Rstudio Interface
#   - 4 panes
#     - console
#     - file editor
#     - enviornment
#     - file viewer
# - running in console vs. in a file
###################

# Setting up
# set up your working directory so R knows where to look for files. You can do this with the following command or by using the menu Session --> Set Working Directory

setwd("~/projects/TeachingRIntro50Minutes")

# we also need to install any packages we are going to use. You typically only need to do this once per package and in future sessions you won't need to do it. 

install.packages("ggplot")

# then we need to load libraries. we do this once for every session. 

library(ggplot2)

# getting help inside R for any of the above commands

?install.packages

# Getting Data Into R ------------
# assigning dato to variables

x <- 5
x
y <- "Rstats"
y
z <- c("rstats", "perl", "bash", "python")
z




# loading from a CSV file
# this example data is from 

# get the csv file

download.file("https://raw.githubusercontent.com/fdsayre/TeachingRIntro50Minutes/master/gapminder.csv", "data/gapminder.csv")

# load it into an object

csv_data <- read.csv("data/gaptestdownload.csv")

csv_data <- read.csv("data/gaptestdownload.csv", header=TRUE)

csv_data <- read.csv("data/gaptestdownload.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))

# using built-in datasets 

install.packages("gapminder")
library(gapminder)

gap <- gapminder
gap


# Exploring Your Data ------------

str()
head()
tail()
dim()
nrow(gap)
ncol(gap)
summary()

gap[1,]
gap[,1:2]

gap[c(1, 2, 50, 100),]

seq(1, 10)
seq(1, 10, by = 2)

gap[seq(1, NROW(gap), by = 10),]
# Plotting Data ------------

library(ggplot2)



plot(data$energy_star_score)

hist(data$energy_star_score)

boxplot(data$energy_star_score)

boxplot(data$energy_star_score ~ data$org_name)


boxplot(data$energy_star_score ~ data$public_private)


ggplot(cardata, aes(x=hp, y=mpg, color=gear)) +
  geom_point()

ggplot(gap, aes(y=lifeExp, x=gdpPercap, color=continent)) +
  geom_point() +
  scale_x_log10()

# Getting Data Out of R ------------

