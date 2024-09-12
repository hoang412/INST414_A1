library(ggplot2)
library(reshape2)

# Import the CSV file
data <- read.csv("D:/INST414/Acquired_studios_by_EA.csv")

#removing $ from file
data$Pre.acquistion_revenue..in.Million. <- as.numeric(gsub("[\\$,]", "", data$Pre.acquistion_revenue..in.Million.))
data$Post.acquistion_revenue..in.Million. <- as.numeric(gsub("[\\$,]", "", data$Post.acquistion_revenue..in.Million.))

# Select relevant columns for graphing
data_selected <- data[, c("Company", "Pre.acquistion_revenue..in.Million.", "Post.acquistion_revenue..in.Million.")]

# Rename columns for convenience
colnames(data_selected) <- c("Company", "Pre_acquisition", "Post_acquisition")

# convert from wide to long
data_long <- melt(data_selected, id.vars = "Company", variable.name = "Stage", value.name = "Revenue")

# Create a grouped bar chart
ggplot(data_long, aes(x = Company, y = Revenue, fill = Stage)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  geom_text(aes(label = scales::comma(Revenue)), position = position_dodge(width = 0.7), vjust = -0.5) +
  theme_minimal() +
  labs(title = "Pre-Acquisition vs Post-Acquisition Revenue (in Million USD)",
       x = "Company", y = "Revenue (in Million USD)") +
  scale_y_continuous(labels = scales::comma) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
