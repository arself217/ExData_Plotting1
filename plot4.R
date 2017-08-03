setwd("/Users/aself/Desktop/Coursera/Exploratory/project_1")

dta <- read.table("/Users/aself/Desktop/Coursera/Exploratory/project_1/household_power_consumption.txt", 
                  sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")

dta2 <- dta[dta$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dta2$Date, dta2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
energysubmetering1 <- as.numeric(dta2$Sub_metering_1)
energysubmetering2 <- as.numeric(dta2$Sub_metering_2)
energysubmetering3 <- as.numeric(dta2$Sub_metering_3)

voltage <- as.numeric(dta2$Voltage)
Global_reactive_power <- as.numeric(dta2$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

## plot 1
globalActivePower <- as.numeric(dta2$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## plot 2

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## plot 3
plot(datetime, energysubmetering, xlab="", ylab="Energy sub metering", type = "n")
points(datetime, energysubmetering1, col = "black", type = "s")

points(datetime, energysubmetering2, col = "red", type = "s")

points(datetime, energysubmetering3, col = "blue", type = "s")
legend("topright", lty=1, lwd=2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4

plot(datetime, Global_reactive_power, type="s", xlab="datetime", ylab="Global_reactive_power")


dev.off()