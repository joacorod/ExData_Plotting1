data <- read.table("/Users/joaquinrodriguez/Desktop/exp_1/household_power_consumption.txt", header = TRUE, sep = ";")
data <- subset(data, strptime(Date, "%d/%m/%Y") == "2007-02-01" | strptime(Date, "%d/%m/%Y") == "2007-02-02")
data[data == "?"] <- NA


png("plot1.png")
hist(as.numeric(data$Global_active_power)/1000, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")
dev.off()

