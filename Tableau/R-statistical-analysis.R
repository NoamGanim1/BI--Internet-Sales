# Install and load necessary packages
install.packages("Rserve")
library(Rserve)
Rserve()

install.packages("readxl")  # For reading Excel files
library(readxl)

install.packages("dplyr")  # For data manipulation
library(dplyr)

install.packages("ggplot2")  # For data visualization
library(ggplot2)

# Load the Excel file
file_path <- "C:/Users/yehon/Desktop/נועה/שנה ד סמסטר א/BI/פרויקט/חלק ב BI/DW_Part B_Group_U.xlsx"  
orders <- read_excel(file_path, sheet = "FACT_ORDER_DETAILS")

# Display basic information about the dataset
head(orders)  # First few rows
str(orders)  # Structure of the dataset
summary(orders)  # Summary statistics

### __________ Question 1 __________###
# Compare average total price between returning and new customers
returned_customers <- orders$TotalPrice[orders$ReturnedCustomer == 1]
new_customers <- orders$TotalPrice[orders$ReturnedCustomer == 0]

# Perform a t-test
t_test_result <- t.test(returned_customers, new_customers)
print(t_test_result)

# Calculate mean values
means <- c(mean(new_customers, na.rm = TRUE), mean(returned_customers, na.rm=TRUE))
names(means) <- c("New Customers", "Returned Customers")

# Create a bar plot
barplot(means, 
        main="Average Amount for New vs Returning Customers",
        ylab="Average Amount",
        xlab="Customer Type",
        col=c("lightblue", "lightpink"),
        ylim=c(0, max(means) + 10))

# Add labels to the bars
text(x=1:length(means), y=means, label=round(means, 2), pos=1, cex=0.8, col="black")

### __________ Question 2 __________###
# Compute Pearson correlation between ItemPrice and Amount sold
correlation <- cor.test(orders$ItemPrice, orders$Amount, use = "complete.obs", method = "pearson")
print(paste("Pearson Correlation:", correlation))
print(correlation)

# Scatter plot with regression line
plot(orders$ItemPrice, orders$Amount, 
     main = "Scatter Plot of Item Price vs. Amount",
     xlab = "Item Price",
     ylab = "Amount Sold",
     pch = 19, 
     col = "lightpink",
     ylim = c(0, max(orders$Amount, na.rm = TRUE)), 
     yaxt = "n")

# Adjust y-axis ticks
axis(2, at = seq(0, max(orders$Amount, na.rm = TRUE), by = 1), las = 1)

# Add regression line
abline(lm(Amount ~ ItemPrice, data = orders), col = "lightblue", lwd = 4)

# Add legend
legend("topright", legend = paste("Pearson's r:", round(correlation$estimate, 2)),
       bty = "n", col = "lightblue")

### __________ Question 3 __________###
# Convert OrderDate to Date format
orders_with_companies$OrderDate <- as.Date(orders_with_companies$OrderDate)

# Extract the year from OrderDate
orders_with_companies$OrderYear <- format(orders_with_companies$OrderDate, "%Y")

# Filter data for the years 2020-2023
filtered_data <- orders_with_companies %>%
  filter(OrderYear %in% c("2020", "2021", "2022", "2023"))

# Perform Kruskal-Wallis test to compare revenue across years
kruskal_test <- kruskal.test(TotalPrice ~ OrderYear, data = filtered_data)
print(kruskal_test)

# Create a boxplot for total revenue by year
ggplot(filtered_data, aes(x = as.factor(OrderYear), y = TotalPrice, fill = as.factor(OrderYear))) +
  geom_boxplot() +
  scale_fill_manual(values = c("#66c2a5", "#3288bd", "#5e4fa2", "#1b7837")) + # Blue and green shades
  labs(title = "Distribution of Total Revenue by Year (2020-2023)",
       x = "Year",
       y = "Total Revenue",
       fill = "Year") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
