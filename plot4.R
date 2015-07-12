unzip("exdata-data-household_power_consumption.zip")
columnclasses <- c(rep("character", times = 2), rep("numeric", times = 7))

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = columnclasses, 
                   na.strings = "?")
febdata <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
datetime <- paste(febdata$Date, febdata$Time)
timedata <- strptime(datetime,"%e/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))


# line plot of time vs Global Active Power, see plot2
plot(timedata, febdata$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")


#line plot of datetime vs voltage
plot(timedata, febdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot of datetime vs energy sub metering, no legend box, see plot 3
plot(timedata, febdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(timedata, febdata$Sub_metering_2, col = "orangered")
lines(timedata, febdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",  
       lwd = 1, col = c("black", "orangered", "blue"))

# line plot of date time vs global reactive power 
plot(timedata, febdata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
