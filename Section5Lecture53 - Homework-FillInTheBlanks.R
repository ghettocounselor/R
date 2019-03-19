# See homework challenge PDF
# here: https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section5-Homework-The-Challenge.pdf

#Basic request
# You are required to produce a scatterplot depicting Life Expectancy (y-axis) 
# and Fertility Rate (x-axis) statistics by Country. The scatterplot needs to 
# also be categorised by Countries’ Regions.

# You have been supplied with data for 2 years: 1960 and 2013 and you are 
# required to produce a visualisation for each of these years. Some data has 
# been provided in a csv file, some - in R vectors.The csv file contains 
# combined data for both years.All data manipulations have to be performed 
# in R (not in excel) because this project may be audited at a later stage.
# You have also been requested to provide insights into how the two periods compare.

# Vectors provided in other file 
Country_Code 
Life_Expectancy_At_Birth_1960 
Life_Expectancy_At_Birth_2013

#Set the Working Directory
getwd()
setwd("_")
getwd()

#Import the csv dataset
data <- read.csv("Section5Lecture53 - Homework-Dataset.csv")

#Explore the data
data
head(data,6)      #check top 6 rows
tail(data, rows=7) #check bottom 7 rows
str(data)      #check the structure of the data frame
summary(data)      #check the summary of the data

#Did you pick up that there is more than one year in the data?
#From the challenge we know that there are two: 1960 and 2013

#insight
data$Year
temp <- factor(data$Year)
temp
levels(temp)

#Filter the dataframes
data1960 <- data[data$Year==1960,]
data1960
data2013 <- data[data$Year==2013,]
data2013

#Check row counts
nrow(data1960)
str(data1960) #187 rows
nrow(data2013)
str(data2013) #187 rows. Equal split.

#Create the additional dataframes out of the vectors provided
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

#Check summaries
summary(add1960)
summary(add2013)

#Merge the pairs of dataframes  
?merge
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged1960
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")
merged2013

#Check the new structures
str(merged1960)
str(merged2013)

#We can see an obsolete column in each of the merged dataframes
#Column "Year" is no longer required. Let's remove it
merged1960$Year <- NULL
merged2013$Year <- NULL

#Check structures again
str(merged1960)
head(merged1960)
str(merged2013)
head(merged2013)

#Visualization time
library(ggplot2)

#Visualize the 1960 dataset
?scatter.smooth
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp)
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp,
      colour=Region,                              # colour - gives us the 'by' nature of the request
      size=I(5), 
      alpha=I(0.6),                               #transparency
      main="Life Expectancy vs Fertility (1960)"  #title
   )

#Visualize the 2013 dataset
qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp,
      colour=Region,                              # colour - gives us the 'by' nature of the request
      size=I(5), 
      alpha=I(0.6),                               #transparency
      main="Life Expectancy vs Fertility (2013)"  #title
)





