
#everything happens in a vector in R
a <- c(1,2,3)
b <- c(10,20,30)
b2 <- c(10,20,30,40,50,60)
c <- a + b
d <- a > b
e <- a + b2 # R will have recycled 'a' in this case
