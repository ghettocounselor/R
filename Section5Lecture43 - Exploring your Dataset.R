
?read.csv()

stats <- read.csv("Section5 - P2-Demographic-Data.csv")
#remember you need the file extension (type) ;) without that it don't work
stats
#num of rows
nrow(stats)
#num of cols
ncol(stats)
#basic data view
head(stats)
head(stats, n=10) #if you want to see more
#bottom of data
tail(stats)
#basic structure
?str #display the internal structure of an R object
str(stats) #note that some items are Factors, most notably Income.Group
# we can tell from country name and code we have no duplicates
#provides a breakdown of each column with some summary of distributions/ranges
summary(stats)
