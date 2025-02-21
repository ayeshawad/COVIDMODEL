# Load necessary libraries
library(ComplexHeatmap)
library(circlize)
library(dplyr)
library(ggplot2)  # For visualization

# Load data
data <- read.csv("/Users/away/Downloads/sensitivity_results_5percent_final.csv", row.names = 1, check.names = FALSE)

# Step 1: Filter only the columns corresponding to the positive perturbation (assuming column names include "increase")
positive_perturbation_cols <- grep("increase", colnames(data), value = TRUE)
data_pos <- data[, positive_perturbation_cols, drop = FALSE]  # Keep only these columns

# Step 2: Compute min/max before normalization
data_min <- apply(data_pos, 1, min)  # Get min value for each parameter
data_max <- apply(data_pos, 1, max)  # Get max value for each parameter
min_max_table <- data.frame(Parameter = rownames(data_pos), Min_Value = data_min, Max_Value = data_max)

# Step 3: Z-Score Normalization for Each Column
z_score_normalize <- function(x) {
  mean_x <- mean(x, na.rm = TRUE)  # Compute column mean
  sd_x <- sd(x, na.rm = TRUE)      # Compute column standard deviation
  if (sd_x != 0) {
    return((x - mean_x) / sd_x)  # Compute Z-score
  } else {
    return(rep(0, length(x)))  # If no variation, set to 0
  }
}

data_norm <- apply(data_pos, 2, z_score_normalize)  # Apply Z-score normalization column-wise

# Step 4: Identify the top 20 most sensitive parameters
sensitivity_scores <- apply(data_norm, 1, function(x) max(abs(x)))  # Sensitivity metric (max absolute deviation)
ranked_parameters <- names(sort(sensitivity_scores, decreasing = TRUE))  # Rank all parameters

# Remove unwanted parameters ("stoch_C" and "S0")
filtered_parameters <- setdiff(ranked_parameters, c("stoch_C", "S0"))

# Select the top 20 after removing the unwanted parameters
top_20_indices <- filtered_parameters[1:20]  # Get the first 20 most sensitive ones after exclusion
data_top_20 <- data_norm[top_20_indices, , drop = FALSE]  # Subset data

# Step 5: Remove "(increase)" and "(increased)" from row and column names
rownames(data_top_20) <- gsub(" \\(increase[d]?\\)", "", rownames(data_top_20))  # Fix row names
colnames(data_top_20) <- gsub(" \\(increase[d]?\\)", "", colnames(data_top_20))  # Fix column names

# Step 6: Define Z-score based heatmap colors
col_fun <- colorRamp2(c(-3, 0, 3), c("blue", "white", "red"))  # Z-score: blue = low, white = neutral, red = high

# Step 7: Generate the heatmap without row & column clustering
Heatmap(
  data_top_20,
  name = "Z-Score Deviation",
  col = col_fun,
  show_row_names = TRUE,
  show_column_names = TRUE,
  column_title = "Top 20 Sensitive Parameters (Z-Score Normalization)",
  heatmap_legend_param = list(title = "Z-Score Deviation", color_bar = "continuous"),
  cluster_columns = FALSE,  # Remove column clustering
  cluster_rows = FALSE      # Remove row clustering
)

# Step 8: Extract min/max values for the selected top 20 parameters
min_max_table_filtered <- min_max_table[min_max_table$Parameter %in% top_20_indices, ]

# Print the min/max table in the console
print(min_max_table_filtered)

# Step 9: Optional - Plot min/max values as a bar chart
ggplot(min_max_table_filtered, aes(x = reorder(Parameter, Max_Value), ymin = Min_Value, ymax = Max_Value)) +
  geom_linerange(color = "blue", size = 1) +
  geom_point(aes(y = Min_Value), color = "red", size = 3) +  # Min values in red
  geom_point(aes(y = Max_Value), color = "blue", size = 3) +  # Max values in blue
  coord_flip() +  # Flip for better readability
  labs(title = "Min & Max Values of Top 20 Sensitive Parameters",
       x = "Parameter",
       y = "Value") +
  theme_minimal()