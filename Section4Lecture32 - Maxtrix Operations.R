#matrix operations are about performing calculations with matrix
#note the process with matrix, like vectors things happen item for item
#lets look at our data; Games
Games #it's a matrix
rownames(Games)
colnames(Games)
#ask a question
Games["LeBronJames","2012"]

#lets do an operation with FieldGoals
FieldGoals 
# we can just do math across the matrices
FieldGoals / Games
round(FieldGoals / Games,1) #clean it up a bit

MinutesPlayed / Games
round(MinutesPlayed / Games) #clean it up a bit
