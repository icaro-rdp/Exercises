library(car)
tex_tech_df <- read.csv2("TEXTETECH.csv")


# Exercise 1.3 Run an analysis of variance (ANOVA) model using TES as dependent variable and TET as the only factor (one-factor analysis of variance). Provide appropriate graphical representations and comment the statistical inference results. In case of statistically significant result for the factor TET, run additional post-hoc analyses on the levels of the factor (note: you have to control for the Type I error probability)


# Check the table of the data

table(tex_tech_df$AGE, tex_tech_df$TET)

# !   DB SB ZB
# !   1  8  5  9
# !   2  6  7  8
# !   3 11 13  8

# As we can see is not perfectly balanced, but we can still run the ANOVA

aov_TES_TET <- Anova(lm(TES ~ as.factor(TET), data = tex_tech_df))
print(aov_TES_TET)

boxplot(TES ~ as.factor(TET), data = tex_tech_df, xlab = "TET", ylab = "TES", main = "TES vs TET")

# Further analysis
t_test_DB_SB <- t.test(tex_tech_df$TES[tex_tech_df$TET == "DB"], tex_tech_df$TES[tex_tech_df$TET == "SB"])
t_test_DB_ZB <- t.test(tex_tech_df$TES[tex_tech_df$TET == "DB"], tex_tech_df$TES[tex_tech_df$TET == "ZB"])
t_test_SB_ZB <- t.test(tex_tech_df$TES[tex_tech_df$TET == "SB"], tex_tech_df$TES[tex_tech_df$TET == "ZB"])

# p-value correction for repeated tests (Bonferroni)
number_of_tests <- 3
new_p <- 0.05 / number_of_tests
print(t_test_DB_SB$p.value < new_p)
print(t_test_DB_ZB$p.value < new_p)
print(t_test_SB_ZB$p.value < new_p)

# First and third are significant

# Exercise 1.4 Rerun the analysis, this time by considering also AGE as a second factor in the analysis. Provide the new graphical representations and comment the statistical inference results. In case of statistically significant results (note that here you have 3 distinct inferential tests: main effect of TET, main effect of AGE, and interaction effect TET by AGE), run additional post-hoc analyses on the corresponding significant effects (note: you have to control for the Type I error probability separately for each eventual significant effect).

aov_TES_TETxAGE <- Anova(lm(TES ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df))
print(aov_TES_TETxAGE)

boxplot(TES ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df, xlab = "TET", ylab = "TES", main = "TES vs TET")

# Exercise 1.5 Construct a new variable called COST corresponding (for each participant) to the sum of the variables MD, PD, TD, EFF, and FRU. Run an ANOVA model with COST as the dependent variable and TET and AGE as the two factors in the analysis. Graphical representations, comments on the statistical results, and eventual post-hoc analyses as for Ex. 1.4

COST <- tex_tech_df$MD + tex_tech_df$PD + tex_tech_df$TD + tex_tech_df$EFF + tex_tech_df$FRU

aov_COST_TETxAGE <- Anova(lm(COST ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df))
print(aov_COST_TETxAGE)

boxplot(COST ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df, xlab = "TET", ylab = "COST", main = "COST vs TET")

# Exercise 1.6 Repeat the analysis in Ex. 1.5, this time replacing the COST variable with the PER variable in the
# ANOVA model.

aov_PER_TETxAGE <- Anova(lm(PER ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df))
print(aov_PER_TETxAGE)

boxplot(PER ~ as.factor(TET) * as.factor(AGE), data = tex_tech_df, xlab = "TET", ylab = "PER", main = "PER vs TET")
