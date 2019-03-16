

?matplot
# Description : Plot the 'columns' of one matrix against the columns of another.

FieldGoals #field goals by player per/for year
# that's an OK way to look at the data but not great for graphing the data
matplot(FieldGoals) #note that this just plots the columns and that's not actually what we are after

#lets see what we would have if we graph this
matplot(FieldGoals,type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch=15:18, horiz = F)
#hmm... pecular, right out of the gate this doesn't look bad
#but let's think about what we are saying here. 
matplot(FieldGoals,type="b", pch=15:18, col = c(1:4,6), xlab = "Seasons from Matrix Column #'s")

# ?????? I know there is something here but not quite sure what

# we need to transpose - flip rows to columns and columns to rows
t(FieldGoals)
tFieldGoals <- t(FieldGoals)
tFieldGoals # field goals by year per/for player

# now use the transposed matrix
matplot(t(FieldGoals)) #still not quite what we want
matplot(t(FieldGoals),type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch=15:18, horiz = F)

# still though we have what we'll call un-normalized data, there are some injuries that cause 
# the simple field goals per year to be a bit off
# lets normalize - sounds fancy but it's not ;)
matplot(t(FieldGoals)/Games) # so games are games and this will normalize the Field goals to years
matplot(t(FieldGoals)/Games,type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch=15:18, horiz = F)

#lets try another
matplot(t(FieldGoals)/FieldGoalAttempts,type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players, col = c(1:4,6), pch=15:18, horiz = F)

# posted a couple of questions in Udemy class. 

#lets look at dwight howard
FieldGoals["DwightHoward",1:9]
FieldGoalAttempts["DwightHoward",1:9]
round(FieldGoals["DwightHoward",1:9] / FieldGoalAttempts["DwightHoward",1:9],2)
round(FieldGoals["DwayneWade",1:9] / FieldGoalAttempts["DwayneWade",1:9],2)

round(FieldGoals["DerrickRose",1:9] / FieldGoalAttempts["DerrickRose",1:9],2)
