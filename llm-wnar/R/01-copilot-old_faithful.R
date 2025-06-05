# Install ggplot2 and moderndive packages
install.packages("tidyverse")
install.packages("moderndive")

# Load the packages
library(ggplot2)
library(moderndive)

# Plot waiting by duration for the old_faithful_2024 dataset
ggplot(old_faithful_2024, aes(x = duration, y = waiting)) +
  geom_point() +
  labs(title = "Waiting Time by Duration",
       x = "Duration (minutes)",
       y = "Waiting Time (minutes)") +
  theme_minimal()
