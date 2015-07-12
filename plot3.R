unzip("exdata-data-household_power_consumption.zip")
columnclasses <- c(rep("character", times = 2), rep("numeric", times = 7))

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = columnclasses, 
                   na.strings = "?")
febdata <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
datetime <- paste(febdata$Date, febdata$Time)
timedata <- strptime(datetime,"%e/%m/%Y %H:%M:%S")
plot(timedata, febdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(timedata, febdata$Sub_metering_2, col = "orangered")
lines(timedata, febdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "orangered", "blue"))



dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
