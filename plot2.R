## Retrieving Household Power Consumption and subsetting data to specific days
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")
powerdata2 <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert measure to numeric for plotting y axis
globalactive <- as.numeric(powerdata2$Global_active_power)

## Combine date and time for x axis
dateandtime <-strptime(paste(powerdata2$Date, powerdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Final plot is line plot as PNG file
png("plot2.png", width = 480, height = 480)
plot(dateandtime, globalactive, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()