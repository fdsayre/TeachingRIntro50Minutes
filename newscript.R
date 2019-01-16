
######


ggplot(data = gap,
       mapping = aes(x = year,
                     y = lifeExp,
                     by = country,
                     color = continent)) +
  geom_line()
)

ggplot(data = gap,
       mapping = aes(x = year,
                     y = lifeExp,
                     by = country)) +
  geom_line() +
  facet_wrap(~ continent)
)


pre1970 <- gap[gap$year < 1970,]

write.csv(gap, file = "gapminder.csv", row.names=FALSE)


data <- read.csv("gapminder.csv", header = TRUE)
