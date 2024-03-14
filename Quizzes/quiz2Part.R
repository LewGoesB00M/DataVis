set.seed(123)
diamondsSample <- diamonds[sample(nrow(diamonds), 100),]

ggplot(data = diamondsSample, aes(log(carat), log(price)), color = color) +
  geom_point() +
  geom_smooth() +
  facet_grid(cut ~ color)