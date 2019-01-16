# Code from: http://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html 

download.file("https://ndownloader.figshare.com/files/2292169", "../portal_data_joined.csv")

surveys <- read.csv("portal_data_joined.csv")

head(surveys)

View(surveys)

str(surveys)


dim(surveys)
nrow(surveys)
ncol(surveys)
 
rownames(surveys)

str(surveys)
summary(surveys)
