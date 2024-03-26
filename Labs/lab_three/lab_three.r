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


# Represent these graphs in a single window

par(mfrow = c(1, 3))
plot(TT1t1, TT1t2, col = "#97ecbc", pch = 19, cex = 1, main = "Scatter plot of Time on Task 1 at time 1 and Time on Task 1 at time 2", xlab = "Time on Task 1 at time 1", ylab = "Time on Task 1 at time 2")

plot(TT2t1, TT2t2, col = "#ec97ea", pch = 19, cex = 1, main = "Scatter plot of Time on Task 2 at time 1 and Time on Task 2 at time 2", xlab = "Time on Task 2 at time 1", ylab = "Time on Task 2 at time 2")

plot(TT3t1, TT3t2, col = "#97b3ec", pch = 19, cex = 1, main = "Scatter plot of Time on Task 3 at time 1 and Time on Task 3 at time 2", xlab = "Time on Task 3 at time 1", ylab = "Time on Task 3 at time 2")



# Exercise 1.2 For each of the three time on task variables compute the correlation between occasion/time 1
# and occasion/time 2

cor(TT1t1, TT1t2)
cor(TT2t1, TT2t2)
cor(TT3t1, TT3t2)

# Exercise 1.3 Repeat the correlational analyses for the time on task variables by limiting the observations in the data set to male participants only. Next, rerun the analyses this time considering the female group.

# Males

TT1t1_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT1t1
TT1t2_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT1t2
TT2t1_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT2t1
TT2t2_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT2t1
TT3t1_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT3t1
TT3t2_M <- sport_watch_df[sport_watch_df$Gender == "M", ]$TT3t2

cor(TT1t1_M, TT1t2_M)
cor(TT2t1_M, TT2t2_M)
cor(TT3t1_M, TT3t2_M)

# Females

TT1t1_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT1t1
TT1t2_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT1t2
TT2t1_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT2t1
TT2t2_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT2t1
TT3t1_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT3t1
TT3t2_F <- sport_watch_df[sport_watch_df$Gender == "F", ]$TT3t2

cor(TT1t1_F, TT1t2_F)
cor(TT2t1_F, TT2t2_F)
cor(TT3t1_F, TT3t2_F)

# Exercise 1.4 Verify if there is an association between Task success on Task 1 (at occasion/time 1) and Task success on Task 1 (at occasion/time 2). Hint: Use the descriptive Chi-square statistic to measure the level of association between the two variables.

SuccT1t1 <- sport_watch_df$SuccT1t1
SuccT1t2 <- sport_watch_df$SuccT1t2

cont_table_succT1_t1_t2 <- table(SuccT1t1, SuccT1t2)

variable_assoc_succT1_t1_t2 <- chisq.test(cont_table_succT1_t1_t2)$statistic

print(variable_assoc_succT1_t1_t2)

# Exercise 1.5 Check if there is an association between Gender and Task success on Task 1 (at occasion/time 2)

gender <- sport_watch_df$Gender

cont_table_succT1t2_gender <- table(SuccT1t2, gender)

variable_ass_succT1t2_gender <- chisq.test(cont_table_succT1t2_gender)$statistic

print(variable_ass_succT1t2_gender)

# Exercise 1.6 Check if there is an association between Gender and the satisfaction item Sat2

sat2 <- sport_watch_df$Sat2

cont_table_sat2_gender <- table(sat2, gender)

variable_ass_sat2_gender <- chisq.test(cont_table_sat2_gender)$statistic

print(variable_ass_sat2_gender)

# Exercise 1.7 Repeat exercises 1.4, 1.5, and 1.6 this time using the normalized Chi -squared statistic.

chi_max_succT1_t1_t2 <- sum(cont_table_succT1_t1_t2) * min(nrow(cont_table_succT1_t1_t2) - 1, ncol(cont_table_succT1_t1_t2) - 1)

chi_max_succT1t2_gender <- sum(cont_table_succT1t2_gender) * min(nrow(cont_table_succT1t2_gender) - 1, ncol(cont_table_succT1t2_gender) - 1)

chi_max_sat2_gender <- sum(cont_table_sat2_gender) * min(nrow(cont_table_sat2_gender) - 1, ncol(cont_table_sat2_gender) - 1)

chi_norm_succT1_t1_t2 <- variable_assoc_succT1_t1_t2 / chi_max_succT1_t1_t2

chi_norm_succT1t2_gender <- variable_ass_succT1t2_gender / chi_max_succT1t2_gender

chi_norm_sat2_gender <- variable_ass_sat2_gender / chi_max_sat2_gender

print("here the normalized chi-square")
print(chi_norm_succT1_t1_t2)
print(chi_norm_succT1t2_gender)
print(chi_norm_sat2_gender)
