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

# Initialise plot 4
png("Plot4.png")

# Split frame into 2 x 2 grid so we can fit 4 graphs in one output
par(mfrow = c(2,2))

# Create first corner graph
with(data,plot(datetime,Global_active_power,type = "line",xlab = "",ylab = "Global Active Power"))

# Create second graph
with(data,plot(datetime,Voltage,type = "line",xlab = "datetime",ylab = "Voltage"))

# Create third graph
plot(data$datetime,data$Sub_metering_1,type = "line",xlab  = "",ylab = "Energy sub meeting")
lines(data$datetime,data$Sub_metering_2,col = "red")
lines(data$datetime,data$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1),cex = 0.5,bty = "n")

# Create fourth graph and close png
with(data,plot(datetime,Global_reactive_power,type = "line",xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()