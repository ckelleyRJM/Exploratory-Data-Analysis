# Read data file
hpcdata <- "./household_power_consumption.txt"
data <- read.table(hpcdata, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset so that I only have Feb 1 + Feb 2 data, in format dd/mm/yyyy
subSetData <- data[data$Data %in% c("1/2/2007", "2/2/2007"),]

# Convert txt data to numeric values
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
