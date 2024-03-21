library(glue)
library(knitr)
sport_watch_df <- read.csv2("sport_watch_df.csv")

# Exercise 1.1 Provide a graphical representation using the graphical function plot()to show the relationship between Time on Task 1 (at occasion/time 1) and Time on Task 1 (at occasion/time 2). Note: In general, plot(X,Y) yields a scatterplot between a quantitative variable X (represented in the horizontal axis) and a quantitative variable Y (represented in the vertical axis). Repeat the application of the graphical function plot() to the other two pairs of time on task variables: a) Time on Task 2 (at occasion/time 1) and Time on Task 2 (at occasion/time 2) b) Time on Task 3 (at occasion/time 1) and Time on Task 3 (at occasion/time 2).

TT1t1 <- sport_watch_df$TT1t1
TT1t2 <- sport_watch_df$TT1t2
TT2t1 <- sport_watch_df$TT2t1
TT2t2 <- sport_watch_df$TT2t2
TT3t1 <- sport_watch_df$TT3t1
TT3t2 <- sport_watch_df$TT3t2

plot(TT1t1, TT1t2, col = "#97ecbc", pch = 19, cex = 1, main = "Scatter plot of Time on Task 1 at time 1 and Time on Task 1 at time 2", xlab = "Time on Task 1 at time 1", ylab = "Time on Task 1 at time 2")

plot(TT2t1, TT2t2, col = "#ec97ea", pch = 19, cex = 1, main = "Scatter plot of Time on Task 2 at time 1 and Time on Task 2 at time 2", xlab = "Time on Task 2 at time 1", ylab = "Time on Task 2 at time 2")

plot(TT3t1, TT3t2, col = "#97b3ec", pch = 19, cex = 1, main = "Scatter plot of Time on Task 3 at time 1 and Time on Task 3 at time 2", xlab = "Time on Task 3 at time 1", ylab = "Time on Task 3 at time 2")

# Exercise 1.2 For each of the three time on task variables compute the correlation between occasion/time 1
# and occasion/time 2

cor(TT1t1, TT1t2)
cor(TT2t1, TT2t2)
cor(TT3t1, TT3t2)

corr_df <- data.frame("Time on Task" = c("TT1", "TT2", "TT3"), "Correlation" = c(cor(TT1t1, TT1t2), cor(TT2t1, TT2t2), cor(TT3t1, TT3t2)))

print(kable(corr_df, "markdown", caption = "Correlation between occasion/time 1 and occasion/time 2 for each time on task variable"))
