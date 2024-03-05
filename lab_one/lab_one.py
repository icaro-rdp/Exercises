import pandas as pd
import os 

# Imposta il percorso di lavoro

os.chdir("/Users/icaroredepaolini/Library/CloudStorage/GoogleDrive-icaro.redepaolini@studenti.unitn.it/Il mio Drive/First year/Secondo semestre/Quantitative/Exercises/lab_one/")

# Leggi il file CSV
sport_watch_df = pd.read_csv("sport_watch_df.csv", sep=';', decimal=',')
success_columns = ["SuccT1t1", "SuccT1t2", "SuccT2t1", "SuccT2t2", "SuccT3t1", "SuccT3t2"]
# Summary of the data in the time_on_task columns

summary_time_on_task = sport_watch_df[['TT1t1', 'TT2t1', 'TT3t1', 'TT1t2', 'TT2t2', 'TT3t2']].describe()


# Exercise 1.6 Compute the average sum of successes across the three tasks for the male group (hint: use the
# apply function).

average_sum_success_m = sport_watch_df[sport_watch_df['Gender'] == 'm'][success_columns].sum(axis=1).mean()