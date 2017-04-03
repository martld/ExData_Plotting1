## Retrieving Household Power Consumption and subsetting data to specific days
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, dec=".", header = TRUE, sep = ";")
powerdata2 <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert measures to numeric for plotting
globalactive <- as.numeric(powerdata2$Global_active_power)
globalreactive <- as.numeric(powerdata2$Global_reactive_power)
voltage <- as.numeric(powerdata2$Voltage)
submet1 <- as.numeric(powerdata2$Sub_metering_1)
submet2 <- as.numeric(powerdata2$Sub_metering_2)
submet3 <- as.numeric(powerdata2$Sub_metering_3)

## Combine date and time for x axis
dateandtime <-strptime(paste(powerdata2$Date, powerdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Final plot combines four plots as PNG file
## Note: Purposely varies from course layout. I removed datetime
## x labels and made y labels more consistent.
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,2))

#Plot 1
plot(dateandtime, globalactive, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot 2
plot(dateandtime, voltage, type = "l", xlab="", ylab="Voltage")

#Plot 3
plot(dateandtime, submet1, type="l", ylab = "Energy Sub Metering", xlab = "")
lines(dateandtime, submet2, type="l", col = "red")
lines(dateandtime, submet3, type="l", col = "blue")
legend("topright", pch = "l", bty = "n", col = c("black","red","blue"), lty=1, lwd=1.5, legend = c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"))

#Plot 4
plot(dateandtime, globalreactive, type = "l", xlab="", ylab = "Global Reactive Power")

dev.off()