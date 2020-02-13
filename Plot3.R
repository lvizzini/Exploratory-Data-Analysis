rm(list=ls())
Sys.setlocale("LC_TIME", "English")

#read the txt file
h <- read.csv("C:/Users/lvizzini/Desktop/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";",dec=".", na.strings="?",stringsAsFactors=FALSE)

#trasforming character in time
h$d_t<-strptime(paste(h$Date, h$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#subsetting two dates
d<-subset(h, (Date=="1/2/2007" | Date=="2/2/2007"))

#plot line across time
png("plot3.png", width=480, height=480)
plot(d$d_t, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(d$d_t, d$Sub_metering_2, type="l", col="red")
lines(d$d_t, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
