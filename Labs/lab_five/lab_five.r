big_five_df <- read.csv2("big_5_df.csv")
big_five_df <- big_five_df[, 14:23]

# 1.2 calculate the dimensions D1 to D5

D1 <- (6 - big_five_df$BF1) + big_five_df$BF6
D2 <- big_five_df$BF2 + (6 - big_five_df$BF7)
D3 <- (6 - big_five_df$BF3) + big_five_df$BF8
D4 <- (6 - big_five_df$BF4) + big_five_df$BF9
D5 <- (6 - big_five_df$BF5) + big_five_df$BF10

# Exercise 1.3 Construct two new variables called D15 and D23, such that for each individual D15 is the sum of the D1 score and the D5 score; similarly, D23 is the sum of the D2 score and D3 score.

D15 <- D1 + D5
D23 <- D2 + D3

# Exercise 1.4 Evaluate if the population mean of D15 is significantly larger than the population mean of D23.

Diff <- D15 - D23

boxplot(Diff, main = "Difference between D15 and D23")
abline(0, 0, col = "red")

t.test(Diff, mu = 0, alternative = "greater")

# Or if we want to use the t-test for matched pairs

t.test(D15, D23, paired = TRUE, alternative = "greater")

# Data:  D15 and D23
# t = 1.1111, df = 49, p-value = 0.136
# alternative hypothesis: true mean difference is greater than 0

# So we can't reject the null hypothesis that the population mean of D15 is significantly larger than the population mean of D23.
