
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

#---------------- basic operations with a dataframe
stats[1:10,] #basic subsetting
stats[3:9,]
stats[c(4,100),] # only 4 and 100
# remembering how the [] work;
stats[1,] # NOTE;
is.data.frame(stats[1,])
#NOTE: no need for the drop variable
is.data.frame(stats[,1])
#NOTE: here it's opposite, we now don't have a dataframe 

#INTERESTING; SPECIFY A ROW ONLY AND WE GET A DATAFRAM, SPECIFIY A COLUMN ONLY WE GET A VECTOR
is.data.frame(stats[,1,drop=F]) # gives us a dataframe

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
#basically we can get a vector from a process of multiply

#add a column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

stats$xyz <- 1:5 #add another column where the vector added isn't of the same lenght
head(stats, n=10) # notice that the recycling just goes on and on

#remove column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats) #we have cleaned up the columns we added


#------------------- filtering Data Frames
stats <- read.csv("Section5 - P2-Demographic-Data.csv")

head(stats)
stats$Internet.users < 2 # this gives us a vector
filter <- stats$Internet.users < 2 
is.vector(filter) #we have a vector
stats[filter,] #what's happening here is we are passing our true/false vector to a datafram []
# to the stats function and everytime it comes across a TRUE it will display that row

#lets to another
stats[stats$Birth.rate > 40 ,]
# what we learned here is that we can pass not only the row numbers
# but also we can pass TRUE / FALSE

#another dual filter
stats[stats$Birth.rate > 40 & stats$Internet.users < 2 ,]

#lets filter by a categorical variable
stats[stats$Income.Group == "High income", ]
levels(stats$Income.Group)

#find Malta
stats[stats$Country.Name == "Malta", ]


#----------------- Introduction to qplot
stats <- read.csv("Section5 - P2-Demographic-Data.csv")
#install.packages("ggplot2")
#library(ggplot2)
?gplot
qplot(data=stats, x=Internet.users, )
qplot(data=stats, x=Income.Group, y=Birth.rate, )
# if you want to assign a value to something like size put I() around the data
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3) )
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot") # pretty sweet :)




#----------------- Visualizing with qplot
stats <- read.csv("Section5 - P2-Demographic-Data.csv")

qplot(data = stats, x=Internet.users, y=Birth.rate)
qplot(data = stats, x=Internet.users, y=Birth.rate,
      colour=I("red"), size=I(4))
#now let's see three elements in the one graph
qplot(data = stats, x=Internet.users, y=Birth.rate,
      colour=Income.Group, size=I(4)) #now map colour to something in the data



#------------------- Buidling Data frames
#create vectors in CountryRegion file
# here: https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Country-Region-Vectors.zip

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
#clean up column names
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)

#lets get more efficient and change names during the build of the dataframe
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, 
                   Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)


#------------------- Merging data frames
head(stats)
head(mydf)
#lets put them together, matching them by Country Code
# we use merge
?merge      # the by.x and by.y is the thing that you are matching/connecting on
# where x is the first dataframe and y is the second dataframe 
merged <- merge(stats, mydf, by.x= "Country.Code", by.y = "Code") #note the by.y column will be removed
head(merged)
#littl bit of clean up to remove duplicate column of diffferent name
merged$Country <- NULL
str(merged)
tail(merged)
