#homework file https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section6-Homework-The-Challenge.pdf

#Import the new Data - different data from class it seems
getwd()
#setwd("_")
mov <- read.csv("Section6-Homework-Data.csv")

#Data Exploration
head(mov) #top rows
summary(mov) #column summaries
str(mov) #structure of the dataset

#Activate GGPlot2
#install.packages("ggplot2")
library(ggplot2)

#{Offtopic} This Is A Cool Insight:
ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()
# Notice? No movies are released on a Monday. Ever.

# Now we need to filter our dataset to leave only the 
# Genres and Studios that we are interested in
# We will start with the Genre filter and use the Logical 'OR' aka the pipe |
# operator to select multiple Genres:
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

#Now let's do the same for the Studio filter:
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio ==  "WB") | (mov$Studio ==  "Fox") | (mov$Studio ==  "Universal") | (mov$Studio ==  "Sony") | (mov$Studio ==  "Paramount Pictures")
#another way using the 'in' idea which is interesting
filt2 <- mov$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures")


#Apply the row filters to the dataframe
mov2 <- mov[filt & filt2,]
mov2
str(mov2)
summary(mov2)
colnames(mov2)
colnametest <- colnames(mov2)
colnametest[18]
#Prepare the plot's data and aes layers
#Note we did not rename the columns. 
#Use str() or summary() to find out the correct column names
# here we want to create a base, and include only the aesthetics that we know 
# we need, in this case Genre and Gross...US (the abreviation is OK)
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p #Nothing happens. We need a geom.

#Add a Point Geom Layer
p + 
  geom_point()

#Add a boxplot instead of the points
p + 
  geom_boxplot()

#Notice that outliers are part of the boxplot layer
#We will use this observation later (*)

#Add points
p + 
  geom_boxplot() + 
  geom_point()
#Not what we are after, we want the jitter 

#Replace points with jitter
p + 
  geom_boxplot() + 
  geom_jitter()

#Place boxplot on top of jitter
p + 
  geom_jitter() + 
  geom_boxplot() 

#Add boxplot transparency
p + 
  geom_jitter() + 
  geom_boxplot(alpha=0.7) 

#Good. Now add size and colour to the points:
p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7) 
#See the remaining black points? Where are they from?
#They are part of the boxplot - Refer to our observation (*) above 
# check here
p + 
  geom_boxplot() # these are a part of the box plot

#Let's remove them:
p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

#Let's "Save" our progress by placing it into a new object:
q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA)
q

#Non-data ink
q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q

#HINT: for the next part use ?theme if you need to 
#refresh which parameters are responsible for what

#Theme
q <- q + 
  theme(
    
    #Axes titles:
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    
    #Axes texts:
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),  
    
    #Plot title:
    plot.title = element_text(colour="Black",
                              size=40),
    
    #Legend title:
    legend.title = element_text(size=20),
    
    #Legend text
    legend.text = element_text(size=12)

    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
      )
q

#Final touch. We haven't discussed this in the course,
#However this is how you can change individual legend titles:
q$labels$size = "Budget $M"
q

#Well done!