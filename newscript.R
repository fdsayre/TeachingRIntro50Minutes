
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