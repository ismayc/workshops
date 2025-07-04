# Install ggplot2 an moderndive packages
install.packages("ggplot2")
install.packages("moderndive")

# Load the packages
library(ggplot2)
library(moderndive)

# Plot waiting by duration for old_faithful_2024
ggplot(old_faithful_2024, aes(x = duration, y = waiting)) +
  geom_point() +
  labs(title = "Waiting Time by Duration",
       x = "Duration (minutes)",
       y = "Waiting Time (minutes)") +
  theme_minimal()
