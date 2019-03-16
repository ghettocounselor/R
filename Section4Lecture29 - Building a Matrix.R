#the vectors are being made into matrices by using the function rbind
Salary
Games
MinutesPlayed
#another function you can use is matrix()
#another is cbind()
#along with rbind()
?matrix
?cbind
?rbind
#the distinction is how the function loads the data
#make a vector
my.data <- 1:20
my.data
#make a matrix
A <- matrix(my.data, 4, 5)
A
# makes a matrix wrapping or what's called bending the vector
# we can tell it to bend it differently
B <- matrix(my.data, 4, 5, byrow=T)
B

#now rbind
r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C
# note that r3 was converted to characters

#cbind
c1 <- 1:5
c2 <- -1:-5
c3 <- 6:10
D <- cbind(c1,c2,c3)
D

#notice what happens
c4 <- 5:10
E <- cbind(c1,c2,c4)
E
