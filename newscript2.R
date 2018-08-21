5 + 5

boringvariable <- 5

5 + boringvariable

# this is a very smart comment
boringvariable <- boringvariable * 10

# set my working directory
setwd("~/projects/TeachingRIntro50Minutes")


install.packages("ggplot2")

library(ggplot2)


y <- "Rstats"

z <- c("rstats", "perl", "bash", "python")

mtcars

cardata <- mtcars

head(cardata)

nrow(cardata)

ncol(cardata)


data <- read.csv("mpls_energy_benchmarking_2015.csv")

data <- read.csv("mpls_energy_benchmarking_2015.csv", header=TRUE)

data <- read.csv("mpls_energy_benchmarking_2015.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))

str(data)


summary(data)

summary(data$energy_star_score)


plot(data$energy_star_score)

hist(data$energy_star_score)

boxplot(data$energy_star_score)

boxplot(data$energy_star_score ~ data$org_name)


boxplot(data$energy_star_score ~ data$public_private)
