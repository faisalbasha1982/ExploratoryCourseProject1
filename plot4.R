
# This part reads the file and loads it onto the R dataFrame
consumptionfile <- "household_power_consumption.txt"
dataFrame4 <- read.table(consumptionfile,header=TRUE,sep=";",dec=".",na.strings="?")
subset4 <- dataFrame4[dataFrame4$Date %in% c("1/2/2007","2/2/2007") ,]


# This part for striping data such as Date and Time and subsetting.
dateandtime4 <- strptime(paste(subset4$Date, subset4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAPower4 <- as.numeric(subset4$Global_active_power)
gRPower4 <- as.numeric(subset4$Global_reactive_power)
voltage4 <- as.numeric(subset4$Voltage)
sMtr4 <-   as.numeric(subset4$Sub_metering_1)
sMtr4 <-   as.numeric(subset4$Sub_metering_2)
sMtr4 <-   as.numeric(subset4$Sub_metering_3)


# This part plots all data and creates a png image
par(mfrow = c(2, 2)) 
plot(dateandtime4,gAPower4, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateandtime4,voltage4, type="l", xlab="datetime", ylab="Voltage")
plot(dateandtime4,sMtr1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime4,sMtr2, type="l", col="red")
lines(dateandtime4,sMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateandtime4, gRPower4, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png",width=480,height=480)
dev.off()