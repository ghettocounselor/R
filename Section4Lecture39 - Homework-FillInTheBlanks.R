#Matrix for Free Throws
#SEE HOMEWORK DATA FILE
  #Bind the given vectors to form the matrix
  #FreeThrows <- _(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
  #Remove vectors - we don't need them anymore
  #_(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
  #Rename the columns
  #_(FreeThrows) <- _
  #Rename the rows
  #_(FreeThrows) <- _

#Check the matrix
FreeThrows

#Matrix for Free Throw Attempts
#SEE HOMEWORK DATA FILE
  #Bind the given vectors to form the matrix
  #FreeThrowAttempts <- _(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
  #Remove vectors - we don't need them anymore
  #_(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
  #Rename the columns
  #_(FreeThrowAttempts) <- _
  #Rename the rows
  #_(FreeThrowAttempts) <- _

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myploth <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}
# /* FROM CLASS as example
myplot <- function(data, rows){
  Data <- data[rows,,drop=F] # we are saying use the rows as the data
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot(Salary)
myplot(Salary, 1:3) #again we can now pass what to use for data, and or the rows
myplot(MinutesPlayed/Games)
# */

#Visualize the new matrices
myploth(z=FreeThrows)
myploth(z=FreeThrowAttempts)
# or just provide data, it will be assumed this one variable is the data
myploth(FreeThrows)
myploth(FreeThrows, 1:3) # can pass row numbers, basically which of the who
myploth(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
#(You will need the Games matrix)
myploth(FreeThrowAttempts/Games)
#Notice how Chris Paul gets few attempts per game

#Part 2 - Free Throw Accuracy
myploth(FreeThrows/FreeThrowAttempts)
#And yet Chris Paul's accuracy is one of the highest
#Chances are his team would get more points if he had more FTA's
#Also notice that Dwight Howard's FT Accuracy is extremely poor
#compared to other players. If you recall, Dwight Howard's
#Field Goal Accuracy was exceptional:
myploth(FieldGoals/FieldGoalAttempts)
#How could this be? Why is there such a drastic difference?
#We will see just now...

#Part 3 - Player Style Patterns Excluding Free Throws
myploth((Points-FreeThrows)/FieldGoals)
#Because we have excluded free throws, this plot now shows us
#the true representation of player style change. We can verify
#that this is the case because all the marks without exception
#on this plot are between 2 and 3. That is because Field Goals
#can only be for either 2 points or 3 points.
#Insights:
#1. You can see how players' preference for 2 or 3 point shots
#   changes throughout their career. We can see that almost all
#   players in this dataset experiment with their style throughout
#   their careers. Perhaps, the most drastic change in style has
#   been experienced by Joe Johnson.
#2. There is one exception. You can see that one player has not
#   changed his style at all - almost always scoring only 2-pointers.
#   Who is this mystert player? It's Dwight Howard! 
#   Now that explains a lot. The reason that Dwight Howard's
#   Field Goal accuracy is so good is because he almost always
#   scores 2-pointers only. That means he can be close to the basket
#   or even in contact with it. Free throws, on the other hand require
#   the player to stand 15ft (4.57m) away from the hoop. That's 
#   probably why Dwight Howard's Free Throw Accuracy is poor.




