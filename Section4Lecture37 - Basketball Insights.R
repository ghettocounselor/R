#from Section 4 Lecture 36
myplot <- function(data, rows){
  Data <- data[rows,,drop=F] # we are saying use the rows as the data
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot(Games)

#let's have a play; first Salary metrics
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

#In Game metrics
myplot(MinutesPlayed)
myplot(Points)

#In Game Metrics Normalized
myplot(FieldGoals / Games)
myplot(FieldGoals / FieldGoalAttempts)
myplot(FieldGoalAttempts / Games)
myplot(Points / Games)

#interesting observations
myplot(MinutesPlayed / Games)
myplot(Games)

#Time is valuable
myplot(FieldGoals / MinutesPlayed)

#Player style, 2 or 3 point goals
#note: includes foul shots as points with each Field Goal
myplot(Points / FieldGoals)

#play with treemap
#
myplot2 <- function(data, rows){
  Data <- data[rows,,drop=F] # we are saying use the rows as the data
  treemap(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot2(Games)

treemap()
install.packages("treemap")
