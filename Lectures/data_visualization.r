# create random data to plot with different types of plots

x <- rnorm(100)
y <- rnorm(100)

# scatter plot

plot(x, y, col = "#97ecbc", pch = 19, cex = 1, main = "Scatter plot of X and Y", xlab = "X", ylab = "Y")

# Scatter plot with mean values for X and Y

x_mean <- mean(x)
y_mean <- mean(y)

# If we want to have the mean values in the scatter plot as a point
points(x_mean, y_mean, col = "blue", cex = 2, pch = 19)
# cex is the size of the point (default is 1)

# If we want to have horizontal and vertical lines to the mean values
abline(h = y_mean, col = "#97ecbc")
abline(v = x_mean, col = "#97ecbc")

# Histogram of X
hist(x, col = "lightgreen", main = "Histogram of X", xlab = "X", ylab = "Frequency")
abline(v = x_mean, col = "red", lty = 2, lwd = 2)
abline(v = median(x), col = "black", lty = 2, lwd = 2)

# Boxplot

boxplot(x, y, col = c("lightblue", "lightgreen"), main = "Boxplot of X and Y", xlab = "X and Y", ylab = "Values")

# Is just the graphical representation of the summary of the data
summary(x)
summary(y)

# Kernel density plot
# Likewise the histogram, but with a smooth line instead of bars, the goal is the same, understand the distribution of the data

plot(density(x), col = "blue", main = "Kernel density plot of X", xlab = "X", ylab = "Density")
lines(density(y), col = "red")
# Add also the second density plot (line)
legend("topright", legend = c("X", "Y"), col = c("blue", "red"), lty = 1, cex = 0.8)
