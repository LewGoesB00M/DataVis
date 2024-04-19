setwd("C:/Users/Lewis/DataspellProjects/DataVis/Testing")
library(tidyverse)

# Open the csv file and import it into R, converting string data to factors.
data <- read.csv('googleplaystore.csv', stringsAsFactors = T)
summary(data)

# Replace all instances of 'NA' as a string or a blank string "" to NA.
# The strings 'NA' or " " and NA are two different things to R, and only the
# non-string NA is detected by functions like is.na().
data[(data == 'NA' | data == "" | data == "NaN")] <- NA

# Output a summary of the data.
summary(data)

# Identify rows containing NA.
naRows <- data[rowSums(is.na(data)) > 0,]
# 1469 with no ratings, 8 with no current version, 4 with neither
nrow(naRows)