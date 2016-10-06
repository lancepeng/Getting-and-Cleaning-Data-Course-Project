plot4 <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")
requiredDate <- subset(plot4,plot4$Date == "2007-02-02" | plot4$Date == "2007-02-01")

par(mfrow = c(2, 2))

requiredDate$Global_active_power <- as.numeric(as.character(requiredDate$Global_active_power))
requiredDate$Global_reactive_power <- as.numeric(as.character(requiredDate$Global_reactive_power))
requiredDate$Global_intensity <- as.numeric(as.character(requiredDate$Global_intensity))
requiredDate$Voltage <- as.numeric(as.character(requiredDate$Voltage))
requiredDate$Sub_metering_1 <- as.numeric(as.character(requiredDate$Sub_metering_1))
requiredDate$Sub_metering_2 <- as.numeric(as.character(requiredDate$Sub_metering_2))
requiredDate$Sub_metering_3 <- as.numeric(as.character(requiredDate$Sub_metering_3))
requiredDate$Timestamp <-paste(requiredDate$Date, requiredDate$Time)

with(requiredDate, plot(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(requiredDate, plot(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(requiredDate, plot(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Global_intensity, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(requiredDate, points(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Sub_metering_1, col="black", type="l"))
with(requiredDate, points(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Sub_metering_2, col="red", type="l"))
with(requiredDate, points(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(requiredDate, plot(strptime(requiredDate$Timestamp,"%Y-%m-%d %H:%M:%S"),requiredDate$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()