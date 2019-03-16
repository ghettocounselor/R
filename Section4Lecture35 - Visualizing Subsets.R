
#start of with visualization from before in Lecture 33
matplot(t(MinutesPlayed),type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch=15:18, horiz = F)

#let clean up a bit
Data <- MinutesPlayed[1:3,] # give us 1st 3 players only
matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players[1:3], col = c(1:4,6), pch=15:18, horiz = F)
# legend as well - give us 1st 3 players only

# now to handle vector 
Data <- MinutesPlayed[1,,drop=F] # give us 1st 3 players only
matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players[1], col = c(1:4,6), pch=15:18, horiz = F)
# legend as well - give us 1st 3 players only

#not part of class just my playing around, more complicated than it would appear
#Top 3 minutes played ? lots of mess below here but interesting - needs more work
# basic idea is that you need to sort each year and then grab top n items
MinutesPlayed # 1st question becomes what do you mean by that; by year, overall ??
#let's say by year
MinutesPlayed[,"2005"] #1st the year as a vector
is.vector(MinutesPlayed[,"2005"])
install.packages('dplyr')
library('dplyr')

#from help
df <- data.frame(x = t(MinutesPlayed[,"2005"]))
df %>% top_n(3)
df

# Negative values select bottom from group. Note that we get more
# than 2 values here because there's a tie: top_n() either takes
# all rows with a value, or none.
df %>% top_n(-3)

if (require("Lahman")) {
  # Find 10 players with most games
  # A little nicer with %>%
  tbl_df(df) %>%
    group_by(Players) %>%
    tally(G) %>%
    top_n(10)
  
  # Find year with most games for each player
  tbl_df(df) %>% group_by(Players) %>% top_n(1, G)
}

#this is a very interesting problem :) 
?sort()
