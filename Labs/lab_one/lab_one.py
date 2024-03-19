import pandas as pd

# Esercizio 1.1 Carica il file di dati DATASW.csv nel pacchetto R e assegnalo a un dataframe chiamato DATA.
sport_watch_df = pd.read_csv("sport_watch_df.csv", sep=";", decimal=",")

# Nomi delle colonne utilizzate per gli esercizi
time_on_task_columns = ["TT1t1", "TT2t1", "TT3t1", "TT1t2", "TT2t2", "TT3t2"]
satisfaction_columns = ["Sat1", "Sat2"]
ease_of_use_columns = ["EU1", "EU2"]
success_columns = ["SuccT1t1", "SuccT1t2", "SuccT2t1", "SuccT2t2", "SuccT3t1", "SuccT3t2"]

# Esercizio 1.2 Usa la funzione summary per descrivere il contenuto della variabile time on task
summary_time_on_task = sport_watch_df[time_on_task_columns].describe()

# Esercizio 1.3 Calcola la proporzione di successi nel task 2 al tempo 1 per il gruppo femminile e confrontala con quella corrispondente del gruppo maschile (qui fornisci un confronto di base mostrando semplicemente le due proporzioni calcolate).
tt2t1_m = sport_watch_df[sport_watch_df['Gender'] == 'm']['SuccT2t1']
tt2t1_f = sport_watch_df[sport_watch_df['Gender'] == 'f']['SuccT2t1']

# Calcola le proporzioni
prop_tt2t1_m = tt2t1_m.mean()
prop_tt2t1_f = tt2t1_f.mean()

print("Proporzione di successi nel task 2 al tempo 1 per il gruppo maschile:", prop_tt2t1_m)
print("Proporzione di successi nel task 2 al tempo 1 per il gruppo femminile:", prop_tt2t1_f)