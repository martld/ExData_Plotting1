## Retrieving Household Power Consumption and subsetting data to specific days
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")
powerdata2 <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert measure to numeric for plotting
powerdata2$Global_active_power <- as.numeric(powerdata2$Global_active_power)

## Final plot is Histogram as PNG file
png("plot1.png", width = 480, height = 480)
hist(powerdata2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()