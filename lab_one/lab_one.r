setwd("/Users/icaroredepaolini/Library/CloudStorage/GoogleDrive-icaro.redepaolini@studenti.unitn.it/Il mio Drive/First year/Secondo semestre/Quantitative/Exercises/lab_one/")

# CSV has ; as separator and , as decimal separator so we need to use read.csv2
sport_watch_df <- read.csv2("sport_watch_df.csv")

# Summary of the data in the time_on_task columns

time_on_task_columns <- c("TT1t1", "TT2t1", "TT3t1", "TT1t2", "TT2t2", "TT3t2")
satisfaction_columns <- c("Sat1", "Sat2")
ease_of_use_columns <- c("EU1", "EU2")
success_columns <- c("SuccT1t1", "SuccT1t2", "SuccT2t1", "SuccT2t2", "SuccT3t1", "SuccT3t2")

# Exercise 1.2 Use the summary function to describe the content of the time on task variable

summary_time_on_task <- summary(sport_watch_df[, time_on_task_columns])

# Exercise 1.3 Compute the proportion of successes in task 2 at time 1 for the female group and compare it with the corresponding one of the male group (here provide a basic comparison by simply showing the two computed proportions).


tt2t1_m <- sport_watch_df[sport_watch_df$Gender == "m", "SuccT2t1"]

tt2t1_f <- sport_watch_df[sport_watch_df$Gender == "f", "SuccT2t1"]

## Average the performance of the two groups
prop_tt2t1_m <- sum(tt2t1_m) / length(tt2t1_m)

prop_tt2t1_f <- sum(tt2t1_f) / length(tt2t1_f)

# Exercise 1.4 Provide the summary statistics for the time on task variables by limiting the sample to the
# female group only

summary_time_on_task_f <- summary(sport_watch_df[sport_watch_df$Gender == "f", time_on_task_columns])

# Exercise 1.5 Repeat Ex. 1.4 this time considering the subgroup of participants composed by females who are practicing at least two different sports.

summary_time_on_task_f_2 <- summary(sport_watch_df[sport_watch_df$Gender == "f" & sport_watch_df$Nsports > 1, time_on_task_columns])

# Exercise 1.6 Compute the average sum of successes across the three tasks for the male group (hint: use the
# apply function).

average_sum_success_m <- mean(apply(sport_watch_df[sport_watch_df$Gender == "m", success_columns], 1, sum))

# Exercise 1.7 Compute the average sum of successes across the three tasks for the male group with age
# greater than 30.

average_sum_success_m_age_over_30 <- mean(apply(sport_watch_df[sport_watch_df$Gender == "m" & sport_watch_df$Age > 30, success_columns], 1, sum))

# Exercise 1.8 Compute for each individual the sum of the two easy of use items.

individual_eo_sum <- apply(sport_watch_df[, ease_of_use_columns], 1, sum)

# Exercise 1.9 Verify (in a purely descriptive way – no statistical inference is required) if the average value of number of time on task for task 1 at time 1 is larger for unsuccessful results as compared to successful ones.

tt1t1_unsuccessful <- sport_watch_df[sport_watch_df$SuccT1t1 == 0, "TT1t1"]
tt1t1_successful <- sport_watch_df[sport_watch_df$SuccT1t1 == 1, "TT1t1"]

is_unsuccessful_larger <- mean(tt1t1_successful) < mean(tt1t1_unsuccessful)


# Exercise 1.10 Compute the average value of task time for task 3 at time 2 (tt3t2) for the subgroup of individuals who EITHER would recommend the sport watch to a friend (Sat2) OR are very satisfied with it (Sat1 greater than 3) but not both.

# This is the group that would recommend the watch to a friend but are not satisfied with it
tt3t2_recommend <- sport_watch_df[sport_watch_df$Sat1 == 1 & sport_watch_df$Sat2 <= 2, "TT3t2"]

# This is the group that is satisfied with the watch but would not recommend it to a friend
tt3t2_satisfied <- sport_watch_df[sport_watch_df$Sat1 == 0 & sport_watch_df$Sat2 > 3, "TT3t2"]

## Once we have the two groups we can calculate the average of the two)
avg_recommend <- mean(c(tt3t2_recommend, tt3t2_satisfied))
