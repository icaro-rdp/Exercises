stylus_typing_speed <- c(18.2, 23.6, 26, 20.3, 20.3, 17.1, 24, 14.7, 20.3, 19.7, 22.4, 13.1)
touch_typing_speed <- c(42, 44, 32, 50, 36, 33, 74, 22, 31, 33, 25, 19)

# Exercise 3.1 Construct a data frame called D containing the variables reported in the table showed in Figure 7.12 of the assignment pdf.

typing_speed_df <- data.frame(stylus_typing_speed, touch_typing_speed)


# Exercise 3.2 Reproduce the graphical representation shown in Figure 7.12 according to all its details (use all necessary arguments of the graphical function to obtain a copy of this graphical representation).

# Plot your data
plot(typing_speed_df$touch_typing_speed, typing_speed_df$stylus_typing_speed,
    xlab = "Touch Typing Speed (wpm)", ylab = "Stylus Typing Speed (wpm)",
    col = "blue", pch = 19, xlim = c(0, 80), ylim = c(0, 35)
)

# Get the y-axis tick locations
y_ticks <- c(5, 10, 15, 20, 25, 30, 35)

# Add a horizontal line at each y tick
for (y in y_ticks) {
    abline(h = y, col = "lightgray")
}

# Exercise 3.3 Run a regression model analysis by using TTS (Touch Typing Speed) as independent variable and STS (Stylus Tapping Speed) as dependent variable. Comment the result of the analysis and superimpose the estimated regression line on the previous graphical representation (Ex. 3.2).

reg_model <- lm(stylus_typing_speed ~ touch_typing_speed)
lm_summary <- summary(reg_model)

print(lm_summary)
abline(reg_model, col = "red")

# ! Description of the output of the regression model

# A slope of 0.13 shows a positive relationship, however the p-value of 0.07 is not significant at the 0.05 level. This means that we cannot reject the null hypothesis that the slope is equal to 0.
# With a R-squared of 0.27 we can say that 27% of the variance in the stylus typing speed can be explained by the touch typing speed.
# In practice the role of our independent variable is not clear at all.
# If we wanted to calculate a pearson correlation using the R-squared index, we would get a value of 0.52 by taking the square root, which is a moderate correlation.

# Exercise 3.4 Extract the residuals of the regression model and plot them as a function of the independent variable. Moreover use the abline() function to represent the theoretical line corresponding to the abscissa (x-axis of the Cartesian plane). Note that if the residuals are correctly represented in the linear regression model, then the pair (xi,ei) should be randomly located around this line.

residuals <- lm_summary$residuals
plot(typing_speed_df$touch_typing_speed, residuals, xlab = "Touch Typing Speed (wpm)", ylab = "Residuals", col = "red", pch = 19)
abline(h = 0, col = "blue")

# Exercise 3.5 The function pt(tx,df) in the R environment can be used to integrate the t-distribution with df degrees of freedom from -∞ to the numerical value tx, that is to say, it computes the area under the curve (represented by a t-distribution with df degrees of freedom) from -∞ to the numerical value tx. Use this function to compute the p-values for the beta0 parameter and beta parameter under the assumption that the null hypotheses are: H01 (beta0 = 0), H02 (beta = 1). Use the output of the linear regression analysis (see Ex. 3.4) to set the arguments of the pt()function. Comment the results and provide an interpretation for the null regression model defined by the two hypotheses H01 and H02.

lm_coefficients <- lm_summary$coefficients
t_beta0 <- lm_coefficients[1, 3]
df <- lm_summary$df[2] # Taken by accessing the output of the summary function
p_value_beta0 <- 2 * (1 - pt(t_beta0, df = df))
print(p_value_beta0)

t_beta <- lm_coefficients[2, 1]
standard_error_beta <- lm_coefficients[2, 2]
h0_beta <- 1
new_t <- (t_beta - h0_beta) / standard_error_beta
p_value_beta <- 2 * (pt(new_t, df = df)) # Two-tailed test
print(p_value_beta)


# Exercise 3.6 Run a new regression analysis this time on the standardized values of the two variables TTS and STS. Comment the results (including the inferential decisions) of the new analysis and provide a new graphical representation showing the relation between the two variables and the corresponding linear regression model. Verify that the sample correlation between TTS and STS corresponds to the new estimated slope in the linear regression. Finally, re-compute the p-values under the null hypotheses defined in Ex. 3.5. Comments the new inferential results.

std_tts <- scale(typing_speed_df$touch_typing_speed)
std_sts <- scale(typing_speed_df$stylus_typing_speed)

std_reg_model <- lm(std_sts ~ std_tts)
std_lm_summary <- summary(std_reg_model)

print(std_lm_summary)

plot(std_tts, std_sts, xlab = "Standardized Touch Typing Speed", ylab = "Standardized Stylus Typing Speed", col = "blue", pch = 19)
abline(std_reg_model, col = "red")
