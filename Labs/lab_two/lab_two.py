import pandas as pd
import numpy as np

# Leggi il file CSV
phones_df = pd.read_csv("phones.csv")

# Esercizio 1.2
builds = phones_df['Build'].astype('category')
displays = phones_df['DisplayType'].astype('category')
press_displays = phones_df['PressSesnsDisp'].astype('category')

# Esercizio 1.3
ram = pd.Categorical(phones_df['RAM'], categories=[2, 4, 6], ordered=True)
attractiveness = pd.Categorical(phones_df['Attractiveness'], categories=["Poor", "Modest", "Sufficient", "Appreciable", "High"], ordered=True)

print("Esercizio 1.2 e 1.3 : rappresentazioni categoriche e ordinali")
print(builds)
print(displays)
print(press_displays)
print(ram)
print(attractiveness)
print("\n")

# Esercizio 1.4
cont_table_build_display = pd.crosstab(builds, displays)
prop_table_build_display = cont_table_build_display / cont_table_build_display.sum().sum()

print("Esercizio 1.4 : tabella di contingenza, tabella delle proporzioni, tabella delle probabilità condizionali osservate")
print(cont_table_build_display)
print(prop_table_build_display)
print("\n")

# Esercizio 1.5
summary_length_width_weight = phones_df[["Length", "Width", "Weight"]].describe()

print("Esercizio 1.5 : riepilogo")
print(summary_length_width_weight)
print("\n")

# Esercizio 1.6
corr_length_width = phones_df['Length'].corr(phones_df['Width'])
corr_length_weight = phones_df['Length'].corr(phones_df['Weight'])
corr_width_weight = phones_df['Width'].corr(phones_df['Weight'])

print("Esercizio 1.6 : valori di correlazione")
print(corr_length_width)
print(corr_length_weight)
print(corr_width_weight)
print("\n")

# Esercizio 1.7
aluminum_based = phones_df[phones_df['Build'] == "Alumin"][["Length", "Width", "Weight"]]
range_aluminum_based = aluminum_based.agg(["min", "max"])

print("Esercizio 1.7 : intervalli")
print(range_aluminum_based)
print("\n")