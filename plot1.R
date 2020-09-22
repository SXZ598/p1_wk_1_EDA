#Library
library(datasets)
library(foreign)
library(tidyverse)

#Data
ds <- read.table("/Users/siyi/Coursera/4_1/p1_wk_1_EDA/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dim(ds) 
##filter the data from the dates 2007-02-01 and 2007-02-02
f_ds <- ds[ds$Date %in% c("1/2/2007", "2/2/2007"),]

##Plot 1

hist(f_ds$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()