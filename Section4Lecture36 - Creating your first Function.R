#GREAT SECTION !!!!

#basic idea we make a function
#it acts like a package of code we created
#we'll use something we have done before
Data <- MinutesPlayed[1,,drop=F] # give us 1st 3 players only
matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
legend("bottomleft", inset=0.01, legend = Players[1], col = c(1:4,6), pch=15:18, horiz = F)

#give the function a name, here myplot, note that myplot is an object
myplot <- function(){
  Data <- MinutesPlayed[2:3,,drop=F] # give us 1st 3 players only
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[2:3], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot() #now we have a function called myplot
#kind of boring to keep having to edit function to change plot
#welcome a Variable/Parameter, in this case rows
myplot <- function(rows){
  Data <- MinutesPlayed[rows,,drop=F] # we are saying use the rows as the data
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot() 
myplot(1:3) #we can still pass variables we want to use

#change to a different group of data, this time points
myplot <- function(rows){
  Data <- Points[rows,,drop=F] # we are saying use the rows as the data
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot()
#again that is boring, lets add another parameter
myplot <- function(data, rows){
  Data <- data[rows,,drop=F] # we are saying use the rows as the data
  matplot(t(Data),type="b", pch=15:18, col = c(1:4,6))
  legend("bottomleft", inset=0.01, legend = Players[rows], col = c(1:4,6), pch=15:18, horiz = F)
}
myplot(Salary)
myplot(Salary, 1:3) #again we can now pass what to use for data, and or the rows
myplot(MinutesPlayed/Games)
