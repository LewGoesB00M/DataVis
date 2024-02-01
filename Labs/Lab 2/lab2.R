library(tidyverse)
# ggplot2, dplyr, lubridate, stringr & more are part of tidyverse.

# library(GGally)
# Used to generate a correlation matrix.

interviews <- read.csv("Labs/Lab 2/data/interviews_plotting.csv")
# summary(interviews)

# ggcorr(interviews, label = T, label_alpha = 0.3)
# Shows a higher correlation between no_membrs & number_items

# geom_jitter() uses RNG. To get reproducible results, an RNG seed must be set for predetermined values.
set.seed(1)
# Note that you need to run the whole file for geom_jitter() to account for the seed.
# If it runs on its own line, this is ignored and it will still be random.

interviews %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(width = 0.2, height = 0.2)