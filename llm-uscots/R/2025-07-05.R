# My first time through all of the prompts
# https://chatgpt.com/share/68697e0d-0410-800e-a8ef-3c5e30c8ca57

################# Prompt 1 ###################################

# Load necessary packages
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Number of observations
n <- 1500

# Define generations and their age ranges
generations <- c("Gen Z", "Millennial", "Gen X", "Baby Boomer")
age_ranges <- list(
  "Gen Z" = c(18, 27),
  "Millennial" = c(28, 43),
  "Gen X" = c(44, 59),
  "Baby Boomer" = c(60, 75)
)

# Sample generations with specified probabilities
generation_sample <- sample(
  generations, 
  n, 
  replace = TRUE,
  prob = c(0.25, 0.35, 0.25, 0.15)
)

# Generate ages within realistic range for each generation
age_sample <- map_dbl(generation_sample, function(gen) {
  range <- age_ranges[[gen]]
  sample(seq(range[1], range[2]), 1)
})

# Define travel classes
classes <- c("First Class", "Business Class", "Economy Plus", "Economy")

# Sample travel class
class_sample <- sample(
  classes, 
  n, 
  replace = TRUE,
  prob = c(0.1, 0.2, 0.3, 0.4)
)

# Generate annoyance ratings (1–10)
annoyance_rating <- round(runif(n, min = 1, max = 10), 1)

# Generate tolerance ratings (1–10)
tolerance_rating <- round(runif(n, min = 1, max = 10), 1)

# Generate number of flights per year (0–15)
flies_per_year <- sample(0:15, n, replace = TRUE)

# Combine into tibble
df <- tibble(
  generation = factor(generation_sample, levels = generations, ordered = TRUE),
  age = age_sample,
  class = class_sample,
  annoyance_rating = annoyance_rating,
  tolerance_rating = tolerance_rating,
  flies_per_year = flies_per_year
)

# Preview first 10 rows
print(head(df, 10))

################# Prompt 2 ###################################

# Fit the regression model
model_age_annoyance <- lm(annoyance_rating ~ age, data = df)

# Display regression summary
summary(model_age_annoyance)

# Extract and print regression equation
coef_age <- coef(model_age_annoyance)
cat(
  sprintf(
    "Regression Equation: annoyance_rating = %.3f + (%.3f * age)",
    coef_age[1], coef_age[2]
  )
)

################# Prompt 3 ###################################

# Fit ANOVA model
anova_generation <- aov(annoyance_rating ~ generation, data = df)

# Display ANOVA summary
summary(anova_generation)

################# Prompt 4 ###################################

library(ggplot2)

ggplot(df, aes(x = age, y = annoyance_rating)) +
  geom_point(alpha = 0.4, color = "steelblue") +
  geom_smooth(method = "lm", se = TRUE, color = "darkred") +
  labs(
    title = "Annoyance Rating vs. Age",
    x = "Age",
    y = "Annoyance Rating"
  ) +
  theme_minimal()

ggplot(df, aes(x = generation, y = annoyance_rating, fill = generation)) +
  geom_boxplot() +
  labs(
    title = "Annoyance Rating Across Generations",
    x = "Generation",
    y = "Annoyance Rating"
  ) +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  theme(legend.position = "none")

