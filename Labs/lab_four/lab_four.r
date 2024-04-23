# Read the Fitt's law data
fitts_law_df <- read.csv("fitts_law_df.csv")

# Extract the columns from the data and assign them to variables
distance <- fitts_law_df$Distance
size <- fitts_law_df$Size
direction <- fitts_law_df$Direction
time <- fitts_law_df$Time
traveled_distance <- fitts_law_df$DistanceTraveled
errors <- fitts_law_df$Errors

# Fitt's law says that the time to acquire a target is a function of the distance to and size of the target.
# MT = log2(2D/W)
# where MT is the movement time, D is the distance to the target, and W is the width of the target.
# The coefficients a and b are determined by linear regression.
# D is the distance to the target, and W is the width of the target.

# In this case we will not use a & b as they are not provided in the data set

cor_dist_time <- cor(distance, time)
cor_size_time <- cor(size, time)

print(cor_dist_time)
print(cor_size_time)

# -0.52 indicates a moderate negative correlation, so as the size of the target increases, the time to acquire the target decreases
# 0.20 indicates a weak positive correlation, so as the distance to the target increases, the time to acquire the target increases

# -0.52 indicates a moderate negative correlation, so as the size of the target increases, the time to acquire the target decreases

# Let's plot the data to visualize the relationship between the variables

par(mfrow = c(1, 2))
boxplot(time ~ distance, data = fitts_law_df, xlab = "Distance", ylab = "Time", main = "Time taken to acquire target function of the distance", col = "lightgreen")

boxplot(time ~ size, data = fitts_law_df, xlab = "Size", ylab = "Time", main = "Time taken to acquire target function of the size", col = "lightblue")

fitts_law_eq <- log2((2 * distance) / size)

cor(fitts_law_eq, time)
cor(fitts_law_eq, distance)

# Now create a 6 graph plot to show the relationship between the fitts_law_eq and size of the target

x_vals <- seq(10, 600, 0.5)
sizes <- sort(unique(size))


# Function to calculate the y-axis ranges for the plots in order to have consistent y-axis ranges across all plots
y_axes_ranges <- function(x_vals, sizes) {
    y_min <- 0
    y_max <- 0
    for (x_val in x_vals) {
        for (size in sizes) {
            y_vals <- log2((2 * x_val) / size)
            y_min <- min(y_min, min(y_vals))
            y_max <- max(y_max, max(y_vals))
        }
    }
    return(c(y_min, y_max))
}
print(y_axes_ranges(x_vals, sizes))


par(mfrow = c(2, 2))
# Plot in a 2x2 grid all the sizes and their relationship with the fitts_law_eq and distance
colors <- rainbow(length(sizes))
count <- 1
for (i in sizes) {
    y_vals <- log2((2 * x_vals) / i)
    plot(x_vals, y_vals, type = "l", xlab = "Distance", ylab = "Time", main = paste("Size:", i), col = colors[count], ylim = y_axes_ranges(x_vals, sizes))
    count <- count + 1
}

# correlation between fitts_law_eq and time

cor(fitts_law_eq, time)
print(cor(fitts_law_eq, time))

# correlation between fitts_law_eq and distance if in the left or right direction

left <- fitts_law_df[fitts_law_df$Direction == -1, ]
right <- fitts_law_df[fitts_law_df$Direction == 1, ]

cor_left_ID <- cor(log2((2 * left$Distance) / left$Size), left$Time)
cor_right_ID <- cor(log2((2 * right$Distance) / right$Size), right$Time)

print(cor_left_ID)
print(cor_right_ID)

# Let see the distribution of the left and right direction
par(mfrow = c(1, 1))
boxplot(right$Time, left$Time, data = left, xlab = "Distance", ylab = "Time", col = "lightgreen", names = c("Left", "Right"))
