data <- read.table("/Users/joaquinrodriguez/Desktop/exp_1/household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, strptime(Date, "%d/%m/%Y") == "2007-02-01" | strptime(Date, "%d/%m/%Y") == "2007-02-02")
data[data == "?"] <- NA


png("plot4.png")
par(mfrow=c(2,2))

plot(as.numeric(data$Global_active_power)/1000,type ="l", ylab = "Global Active Power", xlab = "",xaxt="n")
axis(1,c(0, length(as.numeric(data$Global_active_power))/2,length(as.numeric(data$Global_active_power))) ,c("Thu", "Fri", "Sat"))

plot(as.numeric(data$Voltage),type ="l", ylab = "Voltage", xlab = "datetime",xaxt="n")
axis(1,c(0, length(as.numeric(data$Global_active_power))/2,length(as.numeric(data$Global_active_power))) ,c("Thu", "Fri", "Sat"))

plot(as.numeric(data$Sub_metering_1),type ="l", ylab = "Energy sub metering", xlab = "",xaxt="n")
lines(as.numeric(data$Sub_metering_2),type ="l", col = "red")
lines(as.numeric(data$Sub_metering_3),type ="l", col = "blue")
axis(1,c(0, length(as.numeric(data$Global_active_power))/2,length(as.numeric(data$Global_active_power))) ,c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1, cex = 0.75 )

plot(as.numeric(data$Global_reactive_power)/1000,type ="l", ylab = "Global_reactive_power", xlab = "datetime",xaxt="n")
axis(1,c(0, length(as.numeric(data$Global_active_power))/2,length(as.numeric(data$Global_active_power))) ,c("Thu", "Fri", "Sat"))

dev.off()

