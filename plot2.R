unzip("exdata-data-household_power_consumption.zip")
columnclasses <- c(rep("character", times = 2), rep("numeric", times = 7))

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = columnclasses, 
                   na.strings = "?")
febdata <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")
datetime <- paste(febdata$Date, febdata$Time)
timedata <- strptime(datetime,"%e/%m/%Y %H:%M:%S")
plot(timedata, febdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

