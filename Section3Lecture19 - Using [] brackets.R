
#three ways to create a vector
x <- c(1,123,534,13,4)
y <- seq(201,250,11)
z <- rep("Hi!",3)

# so how do we access the vector
w <- c("a","b","c","d","e")
w
# in R the numbering starts with 1 so a is in place 1
w[1]  # give me first item
w[-1] # give me all items but the 1st one
v <- w[-3]
w[1:3] # give me items 1 to 3 of w
w[3:5] # etc...
w[c(1,3,5)] # we can pass a vector to the vector
w[c(-2,-4)] # we can pass a vector to the vetor telling it NOT these items
w[-2:-4]
w[-3:-5]
w[1:2]
w[0]
w[100]
w[-70]
