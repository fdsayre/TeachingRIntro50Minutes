###############
# Jan 15, 2019
# Teaching Intro to R in 70 Minutes
###############

# Setup and exploring the interface ------------
# Installing packages and setting a working directory and commenting 
# https://swcarpentry.github.io/r-novice-gapminder/01-rstudio-intro/index.html

# set up your working directory so R knows where to look for files. You can do this with the following command or by using the menu Session --> Set Working Directory

setwd("~/projects/TeachingRIntro50Minutes")

# we also need to install any packages we are going to use. You typically only need to do this once per package and in future sessions you won't need to do it. 

install.packages("gapminder")
install.packages("ggplot")

# then we need to load libraries. we do this once for every session. 
library(ggplot2)
library(gapminder)
# getting help inside R for any of the above commands


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


csv_data <- read.csv("mpls_energy_benchmarking_2015.csv")

csv_data <- read.csv("mpls_energy_benchmarking_2015.csv", header=TRUE)

csv_data <- read.csv("mpls_energy_benchmarking_2015.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))

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

