
#using the combine function 'c'
MyFirstVector <- c(3, 45, 56, 732)
MySecondVector <- rnorm(100)
is.numeric(MyFirstVector) # checks if this vector/object is numeric
is.integer(MyFirstVector) # by default R stores a vector in Double mode
is.double(MyFirstVector)  # hence this is of Double type

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.double(V2)

V3 <- c("a", "B23", "Hello", 7) #note the 7 is stored as a character
V3
is.character(V3)
is.numeric(V3)

seq() #sequence - like ':'

seq(1,15) # this and 
1:15      # this are the same
seq(1:15) # this is the same but not proper syntax

seq(1,15,2) # sequence 1 - 15 in steps of 2
z <- seq(1,15,4)
z

rep() #replicate

rep(3, 50)
d <- rep(3, 50)
rep("a",5)
x <- c(80,20)
x <- rep(x,10)
x
