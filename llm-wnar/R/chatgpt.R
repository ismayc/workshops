# Load required packages
library(moderndive)
library(tidyverse)

# Load the dataset
data <- un_member_states_2024

ggplot(data, aes(x = continent, y = life_expectancy)) +
  geom_violin(fill = "lightblue", color = "black", trim = FALSE) +
  geom_jitter(width = 0.2, alpha = 0.5, color = "darkgray") +  # Optional: add points
  labs(
    title = "Distribution of Life Expectancy by Continent",
    x = "Continent",
    y = "Life Expectancy"
  ) +
  theme_minimal()


# Load required packages
library(moderndive)
library(tidyverse)

# Load the dataset
data <- un_member_states_2024

# Create the violin plot
ggplot(data, aes(x = continent, y = life_expectancy_2022)) +
  geom_violin(fill = "lightblue", color = "black", trim = FALSE) +
  geom_jitter(width = 0.2, alpha = 0.5, color = "darkgray") +
  labs(
    title = "Distribution of Life Expectancy (2022) by Continent",
    x = "Continent",
    y = "Life Expectancy (2022)"
  ) +
  theme_minimal()
