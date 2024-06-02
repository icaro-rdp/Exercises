# Categorica/Nominal variables
genres <- c("m", "f", "m", "f", "m", "f", "m", "f", "m", "f")
genres <- as.factor(genres) # Levels are m and f

# Why to use as.factor instead of factor? as.factor is a wrapper for factor that calls factor with ordered = FALSE and so it is faster

# We can specify the levels of the factor
genres <- factor(genres, levels = c("m", "f"))

# We can also order the levels and create an ORDINAL SCALE using factor and the ordered argument. The order is the natural order of the levels that we have specified

genres <- factor(genres, levels = c("f", "m"), ordered = TRUE)

##################################################

# We can also use the table function to count the number of occurrences of each level of the factor
table(genres)

## Examples of descriptive statistics for categorical variables

values <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# We can use the mean function to calculate the mean of the values
mean(values)

# We can use the median function to calculate the median of the values
median(values)

# We can use the sd function to calculate the standard deviation of the values
sd(values)

# We can use the var function to calculate the variance of the values
var(values)

# We can use the range function to calculate the range of the values
range(values)

# We can use the quantile function to calculate the quartiles of the values
quantile(values)
# OR
quantile(values, probs = c(0.25, 0.5, 0.75))
# If we want the maxmum number using the quantile function
quantile(values, probs = 1)

##################################################

# We can generate a random sample of 15 elements

set.seed(10) # This is to make the random sample reproducible and not change every time we run the code

values <- rnorm(15)

##################################################

# We can use the table function also on two or more factors to create a contingency table

# Note that th observations of A and B needs to be the same in number
A <- c("a", "b", "a", "b", "a", "b", "a", "b", "a", "b")
B <- c("x", "x", "y", "y", "x", "x", "y", "y", "x", "x")

df_A_B <- data.frame(A, B)
contingency_table <- table(df_A_B) # Output is a 2x2 table with the counts of the combinations of A and B

#    B
# A   x y
#   a 3 2
#   b 3 2

# If we want the marginal frequencies
table(df_A_B) / sum(table(df_A_B))

# Or we can use the prop.table function
prop.table(table(df_A_B)) # This gives the same result as the previous line of code and provides the proportions of the counts
print(margin.table(contingency_table, 1)) # Marginal sum row-wise
print(margin.table(contingency_table, 2)) # Marginal sum column-wise
print(table(A, B)) # This is the same as the previous line of code
