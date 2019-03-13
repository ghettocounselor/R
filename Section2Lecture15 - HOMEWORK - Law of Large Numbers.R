#The Law of Large Numbers
#as the sample size heads towards infinity we will see any 
#randomness head towards the average or expected; 
#coin tosses average or expected is 50/50 heads and tails

# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----
# we are proving the law of large numbers
N <- 1000000                # input here is the sample size
counter <- 0                # set a counter
for(i in rnorm(N)){         # iterate over i for random sample the size of N
  if(i > -1 & i < 1){       # we are testing for 1 standard deviation on either side
    counter <- counter + 1  # adjust counter
  }
}
counter / N                 # devide counter by N sample size to get %

#compare to 68.2%
