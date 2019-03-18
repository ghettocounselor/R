# stuff for this section
# https://www.superdatascience.com/pages/rcourse
# https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Section5-The-Challenge.pdf

# You are employed as a Data Scientist by the World Bank and you are 
# working on a project to analyse the World’s demographic trends.
# You are required to produce a scatterplot illustrating Birth Rate and Internet Usage statistics by Country.
# The scatterplot needs to also be categorised by Countries’ Income Groups.

# You have received an urgent update from your manager.
# You are required to produce a second scatterplot also illustrating Birth Rate 
# and Internet Usage statistics by Country.
# However, this time the scatterplot needs to be categorised by Countries’ Regions. 
# Additional data has been supplied in the form of R vectors.
# file https://sds-platform-private.s3-us-east-2.amazonaws.com/uploads/P2-Country-Region-Vectors.zip

seedata <- read.csv("Section5 - P2-Demographic-Data.csv")
rm(seedata) # clean up
