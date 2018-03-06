# This is the code for plot4.png

# Read in file, convert Date to a Date class, then subset the data according to appropriate date.  Extract submetering groups.
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
low_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
data_subset<-subset(data, (Date >= low_date) & (Date <= end_date))
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2)
subMetering3 <- as.numeric(data_subset$Sub_metering_3)
voltage <- as.numeric(data_subset$Voltage)
gAP <- as.numeric(data_subset$Global_active_power)
gRP <- as.numeric(data_subset$Global_reactive_power)

# get a POSIXct date/time object and create line plot of Global Active Power
dt <- paste(data_subset$Date, data_subset$Time, sep = " ")
dt_final <- as.POSIXct(dt, format = "%Y-%m-%d %H:%M:%S", tz = Sys.timezone())


png("plot4.png")

# partition the plots
par(mfrow = c(2,2))

# plot 1
plot(dt_final, gAP, type = "l", xlab = "", ylab = "Global Active Power")

# plot 2
plot(dt_final, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot 3
plot(dt_final, subMetering1, type = "l", ylab = "Energy Sub metering", xlab = "")
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
lines(dt_final, subMetering2, col = "red", type = "l")
lines(dt_final, subMetering3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# plot 4
plot(dt_final, gRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
