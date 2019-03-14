
#in R remember that all varialbes are Vectors
#functions take the items in a variable and does something with it

#various functions for creating vectors
rnorm() #
c() #combine 
seq() #sequence
rep() #replicate

print() #well print to print the message in the console

#functions (boolean) to check what kind of vectors we have
is.numeric()
is.integer()
is.double()
is.character()

#look at character of elements of a vector
typeof()

sqrt() #square root
paste() #paste

#look at what kind of variables these functions are expecting
#to dig into these things more

#let's look at the ? as in the question mark
?rnorm() #
# example info in lower right window
# elements needed rnorm(n, mean = 0, sd = 1) with explanations following
# the '=' represent items that will default if not entered

rnorm(5, mean=10, sd=8)
rnorm(5,10,8) # only need to name if not in the expected order

c() #combine 
seq(from=10, to=20, by=3) #sequence
#seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
#    length.out = NULL, along.with = NULL, ...)
seq(from=10, to=20, length.out=100) # length out says I want 100 numbers
# from that R figures out the 'by' (note formula in help)
x <- c("a","b","c")
seq(from=10, to=20, along.with=x) #seq looks at the length of X (3 here) and matches that

?rep() #replicate
rep(5,10) # rep 5 10 times
rep(5:6, times=10)
rep(5:6, each=10) #each is interesting
rep(x, times=10) #very interesting replication of characters as well ;)

print() #well print to print the message in the console

#functions (boolean) to check what kind of vectors we have
is.numeric()
is.integer()
is.double()
is.character()

#look at character of elements of a vector
typeof()

?sqrt() #square root
A <- seq(from=10, to=20, along.with=x)
A
B <- sqrt(A)
B #note that we passed a vector to a function and got a vector out

paste() #paste




