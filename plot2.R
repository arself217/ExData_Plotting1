setwd("/Users/aself/Desktop/Coursera/Exploratory/project_1")

dta <- read.table("/Users/aself/Desktop/Coursera/Exploratory/project_1/household_power_consumption.txt", 
                  sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".")

dta2 <- dta[dta$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(dta2$Date, dta2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dta2$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()