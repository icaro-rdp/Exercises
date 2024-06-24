library(car)
library(carData)
A <- as.factor(c(rep("a1", 25), rep("a2", 30), rep("a3", 28)))
Y <- c(rnorm(25, 50, 15), rnorm(30, 46, 10), rnorm(28, 61, 8))
boxplot(Y ~ A, ylab = "Y")
M <- lm(Y ~ A)
Anova(M)

# ! Anova Table (Type II tests)

# !Response: Y
# !           Sum Sq Df F value   Pr(>F)
# !A          6207.7  2  18.471 2.54e-07 ***
# !Residuals 13443.3 80
# !Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# the first DF is equal to the number of levels of the factor minus 1

# the target statistic is F (Fisher's F-test), similar to the t but for the variance.

# and if we look at the output for the lm()

# ! Residuals:
# !     Min      1Q  Median      3Q     Max
# ! -45.423  -5.843   0.721   6.911  29.779

# ! Coefficients:
# !             Estimate Std. Error t value Pr(>|t|)
# ! (Intercept)   44.740      2.593  17.257  < 2e-16 ***
# ! Aa2           -2.544      3.510  -0.725    0.471
# ! Aa3           16.773      3.567   4.702 1.06e-05 ***
# ! ---
# ! Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# ! Residual standard error: 12.96 on 80 degrees of freedom
# ! Multiple R-squared:  0.3159,    Adjusted R-squared:  0.2988
# ! F-statistic: 18.47 on 2 and 80 DF,  p-value: 2.54e-07

# Here we have not only one slope but two, one for each level of the factor. The intercept is A1 (the baseline for out categorical variable).

# Even if we are using a linear model, the categorical variables are as boolean (dummy variables -> https://en.wikipedia.org/wiki/Dummy_variable_(statistics)), so we have a slope for each level of the factor.

# o	The target distribution for each of the ANOVA test is the F distribution or Fisher distribution, the parameters of the F distribution are the degrees of freedom of the numerator (dFN) and degrees of freedom of the denominator (dFD). In A ANOVA test th dFN is the number of levels of the factor minus 1 and the dFD is the number of observations minus the number of levels of the factor. For instance If we have 100 observations with one factor and the factor has 3 levels.
