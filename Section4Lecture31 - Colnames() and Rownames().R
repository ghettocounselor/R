
# !!!!!!!!!!!! feels like 31 should go before 30 !!!!!!!!!!!!!

# looking at named vectors
Charlie <- 1:5
Charlie

#lets work through 'naming the vector' columns
#lets check names
names(Charlie)
#so there is nothing as in NULL
#so let's do something cool and treat names(Charlie) as an object (vector)
names(Charlie) <- c("a","b","c","d","e")
Charlie
# new names ! now we can use the new names
Charlie[3]
Charlie["c"]
# to clear 
names(Charlie) <- NULL
Charlie

# now naming Matrix demensions 1
#just for fun and to notice the replication process
rep(c("a","b","zZ"),3)
rep(c("a","b","zZ"),times=3)
rep(c("a","b","zZ"),each=3)

temp.vec <- rep(c("a","b","zZ"),each=3)
temp.vec

#lets turn vector into matrix
Bravo <- matrix(temp.vec, 3,3)
Bravo
#not a named vector meaning the columns and rows are numbers, lets fix that
rownames(Bravo) <- c("how","are","you?")
Bravo
colnames(Bravo) <- c("X","Y","Z")
Bravo

#lets play a bit
Bravo["are","Y"]
Bravo[2,2] #default stuff still there
Bravo["are","Y"] <- 0 # change a value
Bravo

#to remove names
rownames(Bravo) <- NULL
Bravo

