read.delim("household_power_consumption.txt", sep = ";", na.strings = "?") -> pwrcompsumption
paste(pwrcompsumption$Date, pwrcompsumption$Time) -> pwrcompsumption$fulldate
strptime(pwrcompsumption$fulldate, format = "%d/%m/%Y %H:%M:%S") -> pwrcompsumption$fulldate
subset(pwrcompsumption, fulldate >= "2007-02-01 00:00:00" & fulldate < "2007-02-03 00:00:00") -> pwrsubset
hist(pwrsubset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
