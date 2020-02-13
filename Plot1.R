rm(list=ls())
library(dplyr)

#read the txt file
h <- read.csv("C:/Users/lvizzini/Desktop/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";",dec=".", na.strings="?",stringsAsFactors=FALSE)

#trasforming character in date
h$d<-as.Date(h$Date, format="%d/%m/%Y")

#subsetting two dates
d<-h %>% 
  filter(d=="2007-02-01" | d=="2007-02-02")

#plot histogram
png("plot1.png", width=480, height=480)
hist(d$Global_active_power,col="red",main="Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()
