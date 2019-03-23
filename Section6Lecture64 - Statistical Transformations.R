

#-------------------- DATA Layer
#import data
movies <- read.csv("Section6Datafile - Movie-Ratings.csv")
movies # check data out
head(movies)

# Grammer of Graphics - a cool hisotry of some useful stuff to know
# https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section6-Grammar-Of-Graphics.pdf 

colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
str(movies) # see structure
# note we have some factors and R stores these things as numbers ;)
summary(movies) # see some nice stats
# note the Year variable is being treated as a number, which we don't want
# lets convert Year to a Factor

factor(movies$Year) # to have a look
# so lets do the dance... what we are doing here is using the function 'factor' to transform 
# the variable into a factor, and we are reassigning that as the same item we started with
movies$Year <- factor(movies$Year)
str(movies)
# now year is a factor!


#----------------- AESTHETIC layer
library(ggplot2)
# let's make some aesthetics - define the way our data maps to what you want to see, it's not what you want to see
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) # note this displays an empty graph

# now we'll jump ahead to GEOMETRY but only so we can see ;) 
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

# add some more aesthetics
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=Genre)) +
  geom_point()
# note warning: Warning message: Using size for a discrete variable is not advised.
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()
# budget makes a much more sensible Size element
#>>> This is the 1st request (we will improve this)


#---------------- GEOMETRIES layer - and layer geometries - Plotting with Layers

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

# we can put our data and asethetics into an object
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))
# now we can use the object and add geometries
p + geom_point()
p + geom_line()

# now layer them, really just piling them on top of one another
p + geom_line() + geom_point()


#---------------- Going back a step to Asethetics ;) OVERRIDING AESTHETICS
# make an object
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

# now look at it by adding geometry - how do we overrie the AES items above
q + geom_point()

# override aesthetics
q + geom_point(aes(size=CriticRating))
q + geom_point(aes(colour=BudgetMillions))
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")
#>>> 2nd chart in our deliverables

p + geom_line(size=1) + geom_point() # note we didn't map this size
# we only set it, there's a difference ;) 


#------------------- Mapping vs Setting


r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()            

# add color
#1. Mapping (what we have been doing) - this is more complex and requires the function 'aes'
r + geom_point(aes(colour=Genre))

#2. Setting - this is simpler
r + geom_point(colour="DarkGreen")
#Error
r + geom_point(aes(colour="DarkGreen"))
# this doesn't work because we are mapping the color and DarkGreen is not a variable
# when we 'map' we are mapping to a variable in the data
# setting is that we are 'setting' the color to a color

#more
#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2 Setting
r + geom_point(size=10)
#error
r + geom_point(aes(size=10))
# same problem as above, aes is for mapping to a variable, 10 is not a variable



#------------------- Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10) # binwidth is the bar

#add color by mapping
s + geom_histogram(binwidth = 10, aes(fill=Genre))
#add border by setting
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>>> Chart 3 (we will improve it)

# sometimes you may need a density chart
s + geom_density(aes(fill=Genre), position="stack")
# they are a bit difficult to understand unless the graph really
# lends itself to the data and insight/analysis. 



# --------------- Starting layer tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                  fill="White", colour="Blue")

#another way - it's really a matter of taste which way you go this
# define the aesthetics initially then change, perhaps when stacking graphs
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                  aes(x=AudienceRating),
                   fill="White", colour="Blue")
 
#>>> chart number 4 above
# below - interestingly the Critics ratings are more normally distributed
# this could be because they are following a certain set of rules 
# and the Audience ratings are more statistically distributed
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", colour="Blue")

#>>> chart number 5 above



#---------------------- Statistical Transformations

?geom_smooth
# Description - Aids the eye in seeing patterns in the presence of overplotting. 
# geom_smooth() and stat_smooth() are effectively aliases: 
# they both use the same arguments. Use stat_smooth() if you want to 
# display the results with a non-standard geom.

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip - hack - trick
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u +  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 

#>>> chart number 6

#try with CriticRating
u2 <- ggplot(data=movies, aes(x=Genre, y=CriticRating,
                             colour=Genre))
u2 + geom_boxplot()
u2 + geom_boxplot(size=1.2)
u2 + geom_boxplot(size=1.2) + geom_point()
#tip - hack - trick
u2 + geom_boxplot(size=1.2) + geom_jitter()
#another way
u2 +  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)





