#Library
library(datasets)
library(foreign)
library(tidyverse)

#Data
ds <- read.table("/Users/siyi/Coursera/4_1/p1_wk_1_EDA/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dim(ds) 
##filter the data from the dates 2007-02-01 and 2007-02-02
f_ds <- ds[ds$Date %in% c("1/2/2007", "2/2/2007"),]

##Plot 3
f_ds$datetime <- strptime(paste(f_ds$Date, f_ds$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow = c(2, 2)) 
# 1st
plot(f_ds$datetime, f_ds$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# 2nd
plot(f_ds$datetime, f_ds$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd
plot(f_ds$datetime, f_ds$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(f_ds$datetime, f_ds$Sub_metering_2, type="l", col="red")
lines(f_ds$datetime, f_ds$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# 4th
plot(f_ds$datetime, f_ds$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()