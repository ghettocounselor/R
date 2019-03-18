
?read.csv()
# Reads a file in table format and creates a data frame from it,
# with cases corresponding to lines and variables to fields in the file.

#method 1 - select file manually
stats <- read.csv(file.choose())
stats

#method 2 - set working directory WD and read data - more common method
getwd()
# "/Users/markloessi/R_programing"
# if not what you want then you have to set
setwd()

rm(stats) # to clear previous chosen data
stats <- read.csv("Section5 - P2-Demographic-Data.csv")
#remember you need the file extension (type) ;) without that it don't work