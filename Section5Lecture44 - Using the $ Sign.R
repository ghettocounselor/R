
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

#-------------- Using the $
stats
head(stats)
stats[3,3] # get angola birth.rate
stats[3,"Birth.rate"] #same number
stats["Angola",3] #provides and NA, because although it looks like they are the 
# titles of the rows they really aren't, notice the 1,2,3, etc... off to the left
# in a dataframe the columns are numbered, like in XLS, columns have names but rows numbers

#enter the $
stats$Internet.users
stats$Internet.users[2] #basically the $ extracts a vector
stats[,"Internet.users"] #same as above item
levels(stats$Income.Group) #gives us the various options in this column


