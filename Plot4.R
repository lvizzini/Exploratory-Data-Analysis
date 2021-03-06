rm(list=ls())
Sys.setlocale("LC_TIME", "English")

#read the txt file
h <- read.csv("C:/Users/lvizzini/Desktop/Coursera/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";",dec=".", na.strings="?",stringsAsFactors=FALSE)

#trasforming character in time
h$d_t<-strptime(paste(h$Date, h$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#subsetting two dates
d<-subset(h, (Date=="1/2/2007" | Date=="2/2/2007"))


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot line Global Active Power (kilowatts) across time 
plot(d$d_t, d$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot line Voltage across time 
plot(d$d_t, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot line Energy sub metering across time
plot(d$d_t, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(d$d_t, d$Sub_metering_2, type="l", col="red")
lines(d$d_t, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"),bty = "n")

#plot line Global_reactive_power across time
plot(d$d_t, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
