

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
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

# now look at it by adding geometry - how do we overrie the AES items above
q + geom_point()

# override aesthetics
q + geom_point(aes(size=CriticRating))
q + geom_point(aes(colour=BudgetMillions))
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

p + geom_line(size=1) + geom_point() # note we didn't map this size
# we only set it, there's a difference ;) 



