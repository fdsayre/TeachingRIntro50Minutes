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

# console vs. text file
# running commands from the text file

5 + 5
3 * 5
sqrt(100)


# Setting up ---------------
# set up a project 

# Use FILE --> New Project

# set up your working directory so R knows where to look for files. You can do this with the following command or by using the menu Session --> Set Working Directory

setwd("~/projects/TeachingRIntro50Minutes")

# we also need to install any packages we are going to use. You typically only need to do this once per package and in future sessions you won't need to do it. 

install.packages("ggplot2")

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
x * 5
sqrt(x)
y <- "Rstats"
y
z <- c("rstats", "perl", "bash", "python")
z


# loading from a CSV file
# this example data is from Gapminder

# download the csv file

download.file("https://raw.githubusercontent.com/fdsayre/TeachingRIntro50Minutes/master/data/gapminder.csv", "gapminder.csv")

# load the data into an object called

# just load in the CSV into an object called "csv_data"
csv_data <- read.csv("gapminder.csv")

# explicitely tell R the first row is column names
csv_data <- read.csv("gapminder.csv", header=TRUE)

# tell R what strings are actually NA values
csv_data <- read.csv("gapminder.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))


# Exploring Your Data ------------

str() #see structure

str(csv_data)

# try with the following
head() #see head
tail() #see tail
dim() #see dimensions 
nrow(gap) #number of rows
ncol(gap) #number of columns
summary() #summary stats

# subsetting data

csv_data[1,]
csv_data[,1]
csv_data[,1:2]

csv_data[c(1, 2, 50, 100),]

# Plotting Data with built in plotting functions and ggplot ------------

# built in plotting

hist(csv_data$lifeExp)

boxplot(csv_data$lifeExp ~ csv_data$continent)

plot(csv_data$lifeExp ~ csv_data$gdpPercap)

# ggplot
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

library(ggplot2)

ggplot(csv_data, aes(y=lifeExp, x=gdpPercap)) +
  geom_point() 

# put on a logarithmic scale 
ggplot(csv_data, aes(y=lifeExp, x=gdpPercap)) +
  geom_point() +
  scale_x_log10()

#Add color for continents 
ggplot(csv_data, aes(y=lifeExp, x=gdpPercap, color=continent)) +
  geom_point() +
  scale_x_log10()

# try adding size for population!

# DPLYR -----------
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf

library(dplyr)

# filter = choose rows based on criteria 

Africa_only <- filter(csv_data, continent == "Africa")

ggplot(Africa_only, aes(y=lifeExp, x=gdpPercap, size=pop)) +
  geom_point() +
  scale_x_log10()

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
