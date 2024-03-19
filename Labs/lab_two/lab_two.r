phones_df <- read.csv("phones.csv")


# Exercise 1.2
# Assign to the variables Build, Display, and PressDispl a factorial (categorical) representation by using the appropriate R function.

builds <- factor(phones_df$Build)
displays <- factor(phones_df$DisplayType)
press_displays <- factor(phones_df$PressSesnsDisp)

# Exercise 1.3 Assign to the variables RAM and Attractiveness an ordinal representation using the appropriate R function.

ram <- ordered(phones_df$RAM, levels = c(2, 4, 6))
attractiveness <- ordered(phones_df$Attractiveness, levels = c("Poor", "Modest", "Sufficient", "Appreciable", "High"))

print("Exercise 1.2 and 1.3 : categorical and ordinal representations")
print(builds)
print(displays)
print(press_displays)
print(ram)
print(attractiveness)
cat("\n")


# Exercise 1.4 Construct and show the values of the contingency table obtained on the basis of the categorical variables Build (represented in the rows of the table) and Display (represented in the columns of the table). By using the same contingency table derive a) the corresponding proportion table b) the observed conditional probability table P(Build|Display)

cont_table_build_display <- table(builds, displays)

prop_table_build_display <- table(builds, displays) / sum(cont_table_build_display)

# Or if u want u can use the prop.table function (wrapper for table)

prop_table_build_display <- prop.table(cont_table_build_display)

print("Exercise 1.4 : contingency table, proportion table, observed conditional probability table")
print(cont_table_build_display)
print(prop_table_build_display)
cat("\n")

# Exercise 1.5 Summarize the content of the sub-dataframe composed by the quantitative variables Length,
# Width, and Weight.

summary_length_width_weight <- summary(phones_df[, c("Length", "Width", "Weight")])

print("Exercise 1.5 : summary")
print(summary_length_width_weight)
cat("\n")

# Exercise 1.6 Compute the correlation values between a) Length and Width b) Length and Weight c) Width and Weight.

corr_length_width <- cor(phones_df$Length, phones_df$Width)
corr_length_weight <- cor(phones_df$Length, phones_df$Weight)
corr_width_weight <- cor(phones_df$Width, phones_df$Weight)

print("Exercise 1.6 : correlation values")
print(corr_length_width)
print(corr_length_weight)
print(corr_width_weight)
cat("\n")
# Exercise 1.7 Derive the ranges for each quantitative variable (Length, Width, and Weight) by considering only those smartphones that are aluminum-based.

aluminum_based <- phones_df[phones_df$Build == "Alumin", c("Length", "Width", "Weight")]

range_aluminum_based <- apply(aluminum_based, 2, range)

print("Exercise 1.7 : ranges")
print(range_aluminum_based)
cat("\n")
