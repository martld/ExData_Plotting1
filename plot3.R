## Retrieving Household Power Consumption and subsetting data to specific days
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, dec=".", header = TRUE, sep = ";")
powerdata2 <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

## Convert measures to numeric for plotting y axis
submet1 <- as.numeric(powerdata2$Sub_metering_1)
submet2 <- as.numeric(powerdata2$Sub_metering_2)
submet3 <- as.numeric(powerdata2$Sub_metering_3)

## Combine date and time for x axis
dateandtime <-strptime(paste(powerdata2$Date, powerdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Final plot is 3 line plots as PNG file
png("plot3.png", width = 480, height = 480)
plot(dateandtime, submet1, type="l", ylab = "Energy Sub Metering", xlab = "")
lines(dateandtime, submet2, type="l", col = "red")
lines(dateandtime, submet3, type="l", col = "blue")
legend("topright", pch = "l", col = c("black","red","blue"), lty=1, lwd=1.5, legend = c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"))
dev.off()