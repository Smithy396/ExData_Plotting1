# Load required packages
library(dplyr)
library(readr)
library(lubridate)

# Load txt source file using ; as delimiter
data <- read_delim("C:\\Users\\Sam\\Desktop\\Code\\R Course\\Mod 4\\exdata_data_household_power_consumption\\household_power_consumption.txt", delim = ";")

# Fix date using lubridate
data$Date <- dmy(data$Date)

# Use dplyrs filter function to extract data within specified date range
data <- dplyr::filter(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create and save graph in environment
png("Plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Globat Active Power (kilowatts)",main = "Global Active Power")
dev.off()
