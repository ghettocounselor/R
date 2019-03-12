

# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----

#IF function only runs once
rm(answer) #clears answer before each run through
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else {
  if(x >= -1){
    answer <- "Between -1 and 1"
  } else {
    answer <- "less than -1"
  }
  
}

#the above is nested
#chained is a better way
rm(answer) #clears answer before each run through
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
    answer <- "Between -1 and 1"
  } else {
    answer <- "less than -1"
  }
