

#packages are groups of functions
#often designed to deal with certain tasks or unique types of data
#Note: the directory where packages are stored is called a Library

# https://cran.r-project.org is where many R packages are available
#first we install
install.packages("ggplot2")
#next we activate
library(ggplot2) #note that Library is just a function here, not where the item is

#example of what's possible
qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)
