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

# Create a date/time column with merged dates in correct format
data$datetime <- as_datetime(paste(data$Date, " ", data$Time))

# Create and save graph in environment
png("Plot2.png")
with(data, plot(datetime, Global_active_power,type = "line", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
