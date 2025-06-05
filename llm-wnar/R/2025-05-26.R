# Install ggplot2 and moderndive packages
install.packages("ggplot2")
install.packages("moderndive")

# Load the ggplot2 and moderndive packages
library(ggplot2)
library(moderndive)

# Plot waiting by duration for old_faithful_2024 without using ggplot2
plot(old_faithful_2024$waiting ~ old_faithful_2024$duration,
     xlab = "Duration (minutes)",
     ylab = "Waiting (minutes)",
     main = "Waiting by Duration for Old Faithful 2024",
     col = "blue",
     pch = 19)

# Plot waiting by duration for old_faithful_2024 using ggplot2
ggplot(old_faithful_2024, aes(x = duration, y = waiting)) +
  geom_point(color = "blue") +
  labs(x = "Duration (minutes)", y = "Waiting (minutes)", title = "Waiting by Duration for Old Faithful 2024") +
  theme_minimal()

# Compute the mean of the duration variable
mean_duration <- mean(old_faithful_2024$duration, na.rm = TRUE)
# Print the mean duration
print(paste("Mean Duration:", mean_duration))
