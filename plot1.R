# read the files
consumptionfile <- "household_power_consumption.txt"
dataFrame <- read.table(consumptionfile,header=TRUE,sep=";",dec=".",na.strings="?")

#subsetting the data
subset <- dataFrame[dataFrame$Date %in% c("1/2/2007","2/2/2007") ,]
gAPower <- as.numeric(subset$Global_active_power)

#plot the graph
hist(gAPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",height=480, width=480)
dev.off()