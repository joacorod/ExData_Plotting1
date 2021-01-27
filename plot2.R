data <- read.table("/Users/joaquinrodriguez/Desktop/exp_1/household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, strptime(Date, "%d/%m/%Y") == "2007-02-01" | strptime(Date, "%d/%m/%Y") == "2007-02-02")
data[data == "?"] <- NA


png("plot2.png")
plot(as.numeric(data$Global_active_power)/1000,type ="l", ylab = "Global Active Powwer (kilowatts)", xlab = "",xaxt="n")
axis(1,c(0, length(as.numeric(data$Global_active_power))/2,length(as.numeric(data$Global_active_power))) ,c("Thu", "Fri", "Sat"))

dev.off()

