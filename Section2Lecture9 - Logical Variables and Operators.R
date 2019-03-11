getwd()
setwd("/Users/markloessi/R_programing")

#logical variables - see Google for list
#TRUE T
#FALSE F

4 < 5
10 > 100
4 == 5
# == equal too
#!= not equal too
# <, >
# <=
# >=
# ! (means not)
# | the pipe
# & 
# isTRUE(x)

result <- 4 < 5
result
typeof(result) # gives logical

result2 <- !TRUE #gives FALSE
result2 <- !(5>2)
result2

# tricky thinking
result | result2 # true or false is true
result & result2 # true and false is false
