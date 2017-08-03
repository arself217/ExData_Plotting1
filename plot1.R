setwd("/Users/aself/Desktop/Coursera/Exploratory/project_1")

dta <- read.table("/Users/aself/Desktop/Coursera/Exploratory/project_1/household_power_consumption.txt", 
                  sep = ";", header = TRUE, na.strings="?")

dta <- tbl_df(dta)

dta <- mutate(dta, dmy(dta$Date))

names(dta)[names(dta) == 'dmy(dta$Date)'] <- 'date'

dta2 <- filter(dta, date <= "2007-02-02" & date >= "2007-02-01")

hist(dta2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
title(main = "Global Active Power")


