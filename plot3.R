read.delim("household_power_consumption.txt", sep = ";", na.strings = "?") -> pwrcompsumption
paste(pwrcompsumption$Date, pwrcompsumption$Time) -> pwrcompsumption$fulldate
strptime(pwrcompsumption$fulldate, format = "%d/%m/%Y %H:%M:%S") -> pwrcompsumption$fulldate
subset(pwrcompsumption, fulldate >= "2007-02-01 00:00:00" & fulldate < "2007-02-03 00:00:00") -> pwrsubset
plot(pwrsubset$fulldate, pwrsubset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_1)
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_2, col = "red")
lines(pwrsubset$fulldate, pwrsubset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)
