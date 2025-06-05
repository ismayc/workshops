# Prompt

# Produce a violin plot of life expectancy by region in North America.

# It uses life_expectancy instead of life_expectancy_2022

# 1. Load libraries
library(moderndive)   # for un_member_states_2024
library(dplyr)        # for filtering & reordering
library(ggplot2)      # for plotting
library(forcats)      # for factor reordering

# 2. Prepare the North America subset
na_states <- un_member_states_2024 %>%
  filter(continent == "North America") %>%
  mutate(
    region = fct_reorder(region, life_expectancy_2022, .fun = median)
  )

# 3. Violin plot of life expectancy by region
ggplot(na_states, aes(x = region, y = life_expectancy_2022)) +
  geom_violin(trim = FALSE, fill = "skyblue") +
  stat_summary(
    fun = median,
    geom = "point",
    size = 2,
    color = "darkred"
  ) +
  labs(
    title = "Life Expectancy by Region in North America (UN Member States, 2022)",
    x     = "Region",
    y     = "Life Expectancy (years)"
  ) +
  coord_flip() +
  theme_minimal(base_size = 14)
