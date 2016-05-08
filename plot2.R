#load the file in to frame
consumptionfile <- "household_power_consumption.txt"
dataFrame2 <- read.table(consumptionfile,header=TRUE,sep=";",dec=".",na.strings="?")

#subsetting the dataFrames
subset2 <- dataFrame2[dataFrame2$Date %in% c("1/2/2007","2/2/2007") ,]
dateandtime2 <- strptime(paste(subset2$Date, subset2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gAPower2 <- as.numeric(subset2$Global_active_power)

#plotting the dataset
png("plot2.png",width=480, height=480)
plot(dateandtime2, gAPower2, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()