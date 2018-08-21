5 + 5
object <- 10

setwd("~/projects/TeachingRIntro50Minutes")

install.packages("ggplot")

library(ggplot2)


mtcars
View(mtcars)

cardata <- mtcars


data <- read.csv("mpls_energy_benchmarking_2015.csv", header=TRUE, na.strings=c("N/A", "Not Available", "NA", "0"))

head(data)
ncol(data)

ncol(cardata)
nrow(cardata)

str(data)

summary(data)

summary(data$energy_star_score)

plot(data$energy_star_score)
