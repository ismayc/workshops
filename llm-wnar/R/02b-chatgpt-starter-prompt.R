# Prompt

# With dplyr, select the top 10 countries by size (population) from 
# un_member_states_2024 and display a horizontal bar chart of their 
# populations, ordered descending.

# Note that it incorrectly uses `size` as the population variable
# when it should be `population_2024`.

# 1. Load required packages
library(moderndive)   # for the dataset
library(dplyr)        # for data wrangling
library(ggplot2)      # for plotting
library(forcats)      # for factor reordering

# 2. Select the top 10 countries by population
top10_pop <- un_member_states_2024 %>%
  slice_max(order_by = population_2024, n = 10) %>%            # pick top 10 by 'size'
  mutate(country = fct_reorder(country, population_2024))      # reorder factor for plotting

# 3. Draw a horizontal bar chart
ggplot(top10_pop, aes(x = country, y = population_2024)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title    = "Top 10 UN Member States by Population (2024)",
    x        = "Country",
    y        = "Population"
  ) +
  theme_minimal(base_size = 14)
