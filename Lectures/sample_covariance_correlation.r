# Load the data ( two variables X1 and X2 )
X1 <- c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5)
X2 <- c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68)

X3 <- c(100, 80, 113, 90, 110, 140, 60, 40, 120, 70, 50)
X4 <- c(80.4, 69.5, 75.8, 88.1, 83.3, 99.6, 72.4, 42.6, 108.4, 48.2, 56.8)

# Sample covariance
scatter.smooth(X1, X2, main = "Scatterplot of X1 and X2")
covariance_x1_x2 <- cov(X1, X2)
print(covariance_x1_x2) # 5.501818 says that X1 and X2 are positively correlated and so if X1 increases, X2 also increases

print(cov(X3, X4)) # 550.1818 says that X3 and X4 are positively correlated and so if X3 increases, X4 also increases

# As we can see the covariance is not a standardized measure, i.e. it is not dimensionless and can take any value.

# If we calculated the cov to the variable itself we get the variance because the covariance of a variable with itself is the variance of that variable.

# Pearson linear CORRELATION -> the ratio of the covariance to the product of the standard deviations of the variables. The difference between covariance and correlation is that correlation is a standardized measure, i.e. it is dimensionless and ranges from -1 to 1.


correlation_x1_x2 <- cor(X1, X2)
print(correlation_x1_x2) # 0.8164205 says that X1 and X2 are positively correlated and so if X1 increases, X2 also increases

# Moreover the correlation do not change if we change the scale of the variables
correlation_x3_x4 <- cor(X3, X4)
print(correlation_x3_x4) # 0.8164205 says that X3 and X4 are positively correlated and so if X3 increases, X4 also increases


# One more tip : the sign of the cov "creates" the sign of the correlation and the denominator "rescale" the correlation to be between -1 and 1.

# What happens if we apply a correlation to data that are not linearly related? if we try to apply a linear model to some data that are not linearly related, the correlation will be close to 0. But it makes no sense to apply a linear model to data that are not linearly related. Due to this problem, the correlation is not a good measure of the relationship between two variables if the relationship is not linear and we have to use other measures. (slide 42)
