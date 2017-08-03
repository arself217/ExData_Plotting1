setwd("/Users/aself/Desktop/Coursera/Exploratory/project_1")

dta <- read.table("/Users/aself/Desktop/Coursera/Exploratory/project_1/household_power_consumption.txt", 
                  sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")

dta2 <- dta[dta$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dta2$Date, dta2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
energysubmetering1 <- as.numeric(dta2$Sub_metering_1)
energysubmetering2 <- as.numeric(dta2$Sub_metering_2)
energysubmetering3 <- as.numeric(dta2$Sub_metering_3)
png("plot3.png", width=480, height=480)


plot(datetime, energysubmetering, xlab="", ylab="Energy sub metering", type = "n")
points(datetime, energysubmetering1, col = "black", type = "s")

points(datetime, energysubmetering2, col = "red", type = "s")

points(datetime, energysubmetering3, col = "blue", type = "s")
legend("topright", lty=1, lwd=2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()