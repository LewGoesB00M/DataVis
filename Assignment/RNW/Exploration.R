
###########################################################################

# This file contains the code used to produce the graphs in the report PDF.
# I am uploading the code as an R file rather than uploading the entire .Rnw as
# the Rnw file is over 1,100 lines long.

###########################################################################

# Open the csv file and import it into R, converting string data to factors.
dataDf <- read.csv('C:/Users/Lewis/DataspellProjects/DataVis/Assignment/RNW/data/netflix_titles.csv', stringsAsFactors = T)
summary(dataDf)
# Replace all instances of 'NA' as a string or a blank string "" to NA.
# The strings 'NA' or " " and NA are two different things to R, and only the
# non-string NA is detected by functions like is.na().
dataDf[(dataDf == 'NA' | dataDf == "" | dataDf == "NaN")] <- NA


# Identify rows containing NA.
naRows <- dataDf[rowSums(is.na(dataDf)) > 0,]
nrow(naRows)

library(ggplot2)
library(GGally)
ggcorr(dataDf)