# This is the code for plot 1

# Read in file, convert Date to a Date class, then subset the data according to appropriate date
data <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
low_date <- as.Date("2007-02-01", "%Y-%m-%d")
end_date <- as.Date("2007-02-02", "%Y-%m-%d")
data_subset<-subset(data, (Date >= low_date) & (Date <= end_date))
gAP<-as.numeric(data_subset$Global_active_power)

# Plot the numeric values for global active power
png("plot1.png")
hist(gAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
