# This is the code for plot2.png

# Read in file, convert Date to a Date class, then subset the data according to appropriate date
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
low_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
data_subset<-subset(data, (Date >= low_date) & (Date <= end_date))
gAP <- as.numeric(data_subset$Global_active_power)

# get a POSIXct date/time object and create line plot of Global Active Power
dt <- paste(data_subset$Date, data_subset$Time, sep = " ")
dt_final <- as.POSIXct(dt, format = "%Y-%m-%d %H:%M:%S", tz = Sys.timezone())

# Create line plot of Global Active Power
png("plot2.png")
plot(dt_final, gAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()