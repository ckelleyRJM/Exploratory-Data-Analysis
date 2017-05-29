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

# Create plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
