#load the file in to frame
consumptionfile <- "household_power_consumption.txt"
dataFrame <- read.csv(consumptionfile,header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subsetting the dataFrames
subset <- dataFrame[dataFrame$Date %in% c("1/2/2007","2/2/2007") ,]
dateandtime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAPower <- as.numeric(subset$Global_active_power)

#plotting the dataset
plot(dateandtime, gAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png",width=480, height=480)
dev.off()