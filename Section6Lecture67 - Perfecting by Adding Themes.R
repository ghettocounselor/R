

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

#----------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black")
#facets: a graphing of multiple graphs
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~., scales="free") 
# scales free lets the scale on the right adjust to the values for each graph

#scatterplot
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                           colour=Genre))
#layering
w + geom_point(size=3) + 
  facet_grid(Genre~.) # group of graphs with X, Y from above broken by Genre
w + geom_point(size=3) + 
  facet_grid(.~Year) # shifting to right side of . shifts from rows to columns
w + geom_point(size=3) + 
  facet_grid(Genre~Year) # columns and rows of graphs
w + geom_point(size=3) + 
  geom_smooth() +
  facet_grid(Genre~Year) # add a smother 
w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) # map size to BudgetMillions
#>>> chart 1 again (but will improve more)


#----------------- Coordinates

#Today
#limits
#zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             size=BudgetMillions, 
                             colour=Genre))
m + geom_point()

m + geom_point() + 
  xlim(50,100) # note in warnings we removed some rows
  ylim(50,100)
# the above doesn't always work well
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
    ylim(0,50) # this is cutting out the data

#how do we zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
  coord_cartesian(ylim=c(0,50)) # we have zoomed into the chart
# the data is still present but we are just zoomed so don't see it

#lets improve
w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=(0,100))


#------------------ Themes
# really think of this as the landscape of our charts

o <- ggplot(data=movies, aes(x=BudgetMillions)) 
  
# MAPPING fill to Genre and SETTING the colour to black
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
# now we have save o and its geomitry in h
h + xlab("Money Axis") + ylab("Number of Movies")
 
#label formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  #here we are just going to set these elements not map them
  theme(axis.title.x = element_text(colour="Darkgreen", size=30), 
       axis.title.y = element_text(colour="Red", size=30))

#tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  #here we are just going to set these elements not map them
  theme(axis.title.x = element_text(colour="Darkgreen", size=30), 
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))
?theme

#legend formatting
h + xlab("Money Axis") + 
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  #in theme we are just going to set these elements not map them
  theme(axis.title.x = element_text(colour="Darkgreen", size=30), 
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=20),
        legend.text = element_text(size=20),
        legend.position = c(1,1), 
        # positioning 0,0 is bottom left 0,1 is lower right
        # 1,0 is upper left and 1,1 is top right corner
        legend.justification = c(1,1), # pulls it into graph
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family="Courier"))


