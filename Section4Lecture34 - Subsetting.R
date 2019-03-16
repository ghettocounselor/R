#subsetting is the idea of filtering
#let's play with a vector
x <- c("a","b","c","d","e")
x
x[c(1,5)] #give me the 1st and 5th item in the vector
x[1] #give me 1 value in spot 1
#that's subsetting

#note when we subset a vector we get a vector ?? is that always true?
#same 'can be true' with a matrix but not always

#lets look at same idea in a matrix
Games
Games[1:3,6:10] #give me 1st three rows and columns 6 - 10
Games[c(1,10),] #give me rows 1 & 10 for all col
Games[,c("2008","2009")] #only certain columns !! note we can use names as well as the numbers
Games[1,] # this is not a matrix, how to know
is.matrix(Games[1,])
is.vector(Games[1,]) # ah it's a vector :) 

#what's going on here? R is trying to help ;) 
#with one row R is thinking you want a vector :D
Games[1:2,]
is.matrix(Games[1:2,])
is.vector(Games[1:2,]) # ah it's NOT a vector now :) 

#what to do with the square brackets
Games[1,,drop=F]
is.matrix(Games[1,,drop=F])
# drop will cause R to not make any assumptions about what you are asking for
# R will return the same type of object that you passed it. 