trade_data <- read.csv("/Users/beauweisman/Downloads/historical_trade_data.csv")
head(trade_data)
str(trade_data)
trade_filtered <- subset(trade_data, exports > 200000)
trade_data$trade_balance <- trade_data$exports - trade_data$imports

library(ggplot2)

# Create a line plot
trade_plot <- ggplot(trade_data, aes(x = year, y = trade_balance)) +
  geom_line() +
  labs(title = "Trade Balance Over Time",
       x = "Year",
       y = "Trade Balance") +
  theme_minimal()

# Display the plot
print(trade_plot)

# Save the plot as an image
ggsave("trade_balance_plot.png", plot = trade_plot, width = 8, height = 5)
