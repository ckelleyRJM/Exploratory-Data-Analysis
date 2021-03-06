# Read data file
hpcdata <- "./household_power_consumption.txt"
data <- read.table(hpcdata, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset so that I only have Feb 1 + Feb 2 data, in format dd/mm/yyyy
subSetData <- data[data$Data %in% c("1/2/2007", "2/2/2007"),]

# Convert txt data to numeric values
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

# Create plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) # Assign 2x2 plot matrix

# Plot 1: Top left
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot 2: Top right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3: Bottom left
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot 4: Bottom right
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
