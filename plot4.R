read.delim("household_power_consumption.txt", sep = ";", na.strings = "?") -> pwrcompsumption
paste(pwrcompsumption$Date, pwrcompsumption$Time) -> pwrcompsumption$fulldate
strptime(pwrcompsumption$fulldate, format = "%d/%m/%Y %H:%M:%S") -> pwrcompsumption$fulldate
subset(pwrcompsumption, fulldate >= "2007-02-01 00:00:00" & fulldate < "2007-02-03 00:00:00") -> pwrsubset
par(mfrow = c(2,2))
plot(pwrsubset$fulldate, pwrsubset$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(pwrsubset$fulldate, pwrsubset$Voltage, xlab = "", ylab = "Voltage", type = "l")
plot(pwrsubset$fulldate, pwrsubset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_1)
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_2, col = "red")
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(pwrsubset$fulldate, pwrsubset$Global_reactive_power, xlab = "", ylab = "Global reactive Power", type = "l")
