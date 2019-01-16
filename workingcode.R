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

# Get a copy of this code to follow along

download.file("https://raw.githubusercontent.com/fdsayre/TeachingRIntro50Minutes/master/workingcode.R", "introcode.csv")

# Setting up ---------------
# set up a project 

# Use FILE --> New Project

# set up your working directory so R knows where to look for files. You can do this with the following command or by using the menu Session --> Set Working Directory

setwd("~/projects/TeachingRIntro50Minutes")

# we also need to install any packages we are going to use. You typically only need to do this once per package and in future sessions you won't need to do it. 

install.packages("ggplot")

# then we need to load libraries. we need to do this once for every session. 

library(ggplot2)

# getting help inside R for any of the above commands

?install.packages()
?library()

# Getting Data Into R ------------

# assigning values/data to objects
# basically everything in R is assigned to an object

x <- 5
x
y <- "Rstats"
y
z <- c("rstats", "perl", "bash", "python")
z

# loading from a CSV file
# this example data is from 

# download the csv file into a *data* directory

download.file("https://raw.githubusercontent.com/fdsayre/TeachingRIntro50Minutes/master/gapminder.csv", "data/gapminder.csv")

# load the data into an object called

csv_data <- read.csv("data/gaptestdownload.csv")

csv_data <- read.csv("data/gaptestdownload.csv", header=TRUE)

csv_data <- read.csv("data/gaptestdownload.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))

# ALTERNATIVE: use the built-in datasets 

install.packages("gapminder")
library(gapminder)

gap <- gapminder
gap


# Exploring Your Data ------------

str() #see structure
head() #see head
tail() #see tail
dim() #see dimensions 
nrow(gap) #number of rows
ncol(gap) #number of columns
summary() #summary stats

# subsetting data

gap[1,]
gap[,1:2]

gap[c(1, 2, 50, 100),]

seq(1, 10)
seq(1, 10, by = 2)

gap[seq(1, NROW(gap), by = 10),]


# Plotting Data ------------

library(ggplot2)




hist(csv_data$lifeExp)

boxplot(csv_data$lifeExp ~ csv_data$continent)

plot(csv_data$lifeExp ~ csv_data$gdpPercap)


# move to ggplot2
# ggplot2 is 

ggplot(csv_data, aes(y=lifeExp, x=gdpPercap)) +
  geom_point() 

ggplot(csv_data, aes(y=lifeExp, x=gdpPercap)) +
  geom_point() +
  scale_x_log10()

ggplot(csv_data, aes(y=lifeExp, x=gdpPercap, color=continent)) +
  geom_point() +
  scale_x_log10()

# what else might we want to look at? What other variables are there?
str(csv_data)

geom_bar()
geom_histogram()

# DPLYR -----------
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

library(dplyr)

# filter = choose rows based on criteria 

filter(csv_data, lifeExp < 29)   
filter(gapminder, country == "Canada")

# select = choose columns 

select(csv_data, year, lifeExp)


# using pipes

csv_data %>% head()

# using pipes with dplyr

csv_data %>%
  select(year, lifeExp) %>%
  head(4)

csv_data %>%
  filter(country == "Cambodia") %>%
  select(year, lifeExp) 


csv_data %>%
  filter(country == "Cambodia") %>%
  select(year, lifeExp) %>%
  ggplot(., aes(x=year, y=lifeExp)) +
    geom_point()

# group by



# Getting Data Out of R ------------

write.csv(csv_data, file = "my_exported_data.csv", row.names = FALSE)
