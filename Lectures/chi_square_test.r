sport_watch_df <- read.csv2("sport_watch_df.csv")

# Firstly we want to calculate the frequencies table for the two variables:

cont_table_gender_succT1t1 <- table(sport_watch_df$Gender, sport_watch_df$SuccT1t1)

# If we want to see the relative frequencies, we can use the prop.table function:
percentages_table <- prop.table(cont_table_gender_succT1t1)

# We can also calculate the maginal sum of the table row-wise (gender) and column-wise (success T1t1)
marginal_sum_row <- margin.table(cont_table_gender_succT1t1, 1)

marginal_sum_col <- margin.table(cont_table_gender_succT1t1, 2)

print(marginal_sum_row)
print(marginal_sum_col)

# Same for the relative frequencies:

marginal_freq_row_rel <- marginal_sum_row / sum(cont_table_gender_succT1t1)

marginal_freq_col_rel <- marginal_sum_col / sum(cont_table_gender_succT1t1)

print(marginal_freq_row_rel)
print(marginal_freq_col_rel)

# We can calculate the chi-square test statistic using the chisq.test function:

# The fucntion chisq.test takes as input a contingency table and returns the chi-square test statistic, the p-value and the degrees of freedom.

# In order to print only the descriptive statistics, we can use the $ sign to access the different elements of the output of the chisq.test function.
chi_square_test <- chisq.test(cont_table_gender_succT1t1)$statistic

# In this case the chi-square test statistic is 0.5 that does not mean anything by itself. We can try to normalize and constrain the result to a possible value between 0 and 1.

# In our case the chi_max is equal to N since we have only two rows and two columns in the contingency table.
chi_max <- sum(cont_table_gender_succT1t1) * min(nrow(cont_table_gender_succT1t1) - 1, ncol(cont_table_gender_succT1t1) - 1)

chi_square_test_norm <- chi_square_test / chi_max

print(chi_square_test_norm) # 0.01 is a very low value, so we can conclude that the two variables are independent (which means that the success of the T1t1 is not related to the gender of the participant).

# The goal here is not to infer something we are describing the process of the chi-square test and how to interpret the results.
