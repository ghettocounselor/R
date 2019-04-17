# Chi-Squared test
# URL https://www.r-bloggers.com/chi-squared-test/
# data https://goo.gl/j6lRXD

df <- read.csv("https://goo.gl/j6lRXD")
table(df$treatment, df$improvement)
# improved not-improved
# not-treated       26           29
# treated           35           15

# Chi-sq test
chisq.test(df$treatment, df$improvement, correct=FALSE)
# Pearson's Chi-squared test
#data:  df$treatment and df$improvement
#X-squared = 5.5569, df = 1, p-value = 0.01841
