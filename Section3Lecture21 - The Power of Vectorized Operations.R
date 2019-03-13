

x <- rnorm(5)
x

#this is an r specific programing loop --------- vectorized
for(i in x){ #here i is iterating over the elements of the vector x
  print(i)   #this is possible because R uses vector
}
# we could do this but it's boring
print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])


#more conventional programing loop concept ----- devectorized
print(x[j]) #here j is iterting over the values 1 through 5
for(j in 1:5){
  print(x[j]) #here we are passing value of J to the vector X through the []
}

# ----------------- 2nd part for today

N <- 100
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b

#Devectorized approach
d <- rep(NA,N) #we are creating an empty vector - NA as in n/a same idea
#where N is the N from above as 100 spaces in our empty vector
for(i in 1:N){
  d[i] <- a[i] * b[i]
}

# couple things - available due to the Vector context
# vectorized is cleaner
# vectorized is much cleaner/faster
# R is using C and Fortran technology in the background

