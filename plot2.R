#Library
library(datasets)
library(foreign)
library(tidyverse)

#Data
ds <- read.table("/Users/siyi/Coursera/4_1/p1_wk_1_EDA/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dim(ds) 
##filter the data from the dates 2007-02-01 and 2007-02-02
f_ds <- ds[ds$Date %in% c("1/2/2007", "2/2/2007"),]

##Plot 2
f_ds$datetime <- strptime(paste(f_ds$Date, f_ds$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(f_ds$datetime, f_ds$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()