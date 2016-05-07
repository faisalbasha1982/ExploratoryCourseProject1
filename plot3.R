#reading or loading file in to R data Frame
consumtionfile <- "household_power_consumption.txt"
dataFrame <- read.csv(consumptionfile,header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset <- dataFrame[dataFrame$Date %in% c("1/2/2007","2/2/2007") ,]

#parsing or subsetting the date and time 
dateandtime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAPower <- as.numeric(subset$Global_active_power)
sMtr1 <- as.numeric(subset$Sub_metering_1)
sMtr2 <- as.numeric(subset$Sub_metering_2)
sMtr3 <- as.numeric(subset$Sub_metering_3)


#ploting the dataset to draw the graphs on to an image
plot(dateandtime, sMtr1, type="l", ylab="Energy Submetering", xlab="")
lines(dateandtime, sMtr2, type="l", col="red")
lines(dateandtime, sMtr3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
