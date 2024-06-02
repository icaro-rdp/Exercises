X <- c(9, 8, 12, 9, 10, 14, 5, 4, 13, 7, 5, 3.4, 15.3, 6.8)
Y <- c(9, 6, 8, 9, 7, 10, 8, 4, 11, 5, 4, 2, 12.6, 8.6)
LM <- lm(Y ~ X)
plot(X, Y)
abline(LM)
print(summary(LM))

# when looking at the residuals, do not care too much about the min and max values, but rather focus on the middle quartiles

# If we want to plot the residuals, we can use the following code:

residuals <- LM$residuals
boxplot(residuals, main = "Residuals")
abline(0, 0, col = "red")

# How to interpret the output of the summary function:

# The residuals are the differences between the observed values and the predicted values, the smaller the residuals the better the model, by definition they should be normally distributed around 0 and have a constant variance. The residuals should be homoscedastic, meaning that the variance of the residuals should be constant across all levels of the independent variable.

# The smaller the standard error the more reliable is the model in terms of inferential stat, 1.13 for the intercept and 0.12 for the slope is not bad

# The t-value is the ratio of the estimate Std and the standard error (est_Std/Std), the higher the t-value the more significant is the coefficient.

# The p-value is the probability of observing a t-value as extreme as the one observed, given that the null hypothesis is true. The smaller the p-value the more significant is the coefficient. In this case the p-values inform us that we don't have enough evidence to reject the null hypothesis that the intercept is equal to 0.

# However we have enough evidence to reject the null hypothesis that the slope is equal to 0. Because the p-value is smaller than 0.05 -> 0.00013

# We can have different scenarios, in one case we can have a significant slope and a non-significant intercept, in another case we can have a significant intercept and a non-significant slope, in another case we can have both significant, in another case we can have both non-significant.

# The R-squared index is very relevant because tells us and overall info about how good is our model in predicting the dependent variable, in this case the R-squared is 0.77, which means that 77% of the variance in the dependent variable is explained by the independent variable. The closer the R-squared is to 1 the better is the model. The closer the R-squared is to 0 the worse is the model.

# The degrees of freedom are the number of observations minus the number of parameters estimated by the model, in this case 12 - 2 = 10.
