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
