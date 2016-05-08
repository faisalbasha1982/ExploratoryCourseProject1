#reading or loading file in to R data Frame
consumtionfile <- "household_power_consumption.txt"
dataFrame3 <- read.table(consumptionfile,header=TRUE,sep=";",dec=".",na.strings="?")

#parsing or subsetting the date and time 
subset3 <- dataFrame[dataFrame3$Date %in% c("1/2/2007","2/2/2007") ,]
dateandtime3 <- strptime(paste(subset3$Date, subset3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAPower <- as.numeric(subset3$Global_active_power)
sMtr1 <- as.numeric(subset3$Sub_metering_1)
sMtr2 <- as.numeric(subset3$Sub_metering_2)
sMtr3 <- as.numeric(subset3$Sub_metering_3)


#ploting the dataset to draw the graphs on to an image
plot(dateandtime3, sMtr1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime3, sMtr2, type="l", col="red")
lines(dateandtime3, sMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
