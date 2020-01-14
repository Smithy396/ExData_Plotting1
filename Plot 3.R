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
png("Plot3.png")
plot(data$datetime,data$Sub_metering_1, type = "line",xlab  = "",ylab = "Energy sub meeting")
lines(data$datetime,data$Sub_metering_2, col = "red")
lines(data$datetime,data$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1))
dev.off()
