# Read data file
Download the file manually from this link: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
Set your working directory as wherever that ^ file is, or move the file to your current working directory

hpcdata <- "./household_power_consumption.txt"
data <- read.table(hpcdata, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subset so that I only have Feb 1 + Feb 2 data, in format dd/mm/yyyy
subSetData <- data[data$Data %in% c("1/2/2007", "2/2/2007"),]

# Convert txt data to numeric values
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create plot
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
