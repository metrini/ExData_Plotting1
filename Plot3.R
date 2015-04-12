##Function reads in "household_power_consumption.txt",
##Creates a subset between Date "1/2/2007" to "2/2/2007"
##Creats and adds Data/Time to subset
##Saves Plot to PNG
plot3<- function(){
	#Read in txt file 
	myData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character","character",rep("numeric",7)), na.strings="?")
	#Subset of entire dataset
	myData<-myData[(myData$Date == "1/2/2007") | (myData$Date == "2/2/2007"),]
	#Date/Time column created and added to subset
	myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
	
	#PNG Graphic device opened
	png(filename = "plot3.png", width = 480, height = 480, units = "px")
    #Three Plots drawn
    plot(myData$DateTime, myData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(myData$DateTime, myData$Sub_metering_2, type="l", col="red")
    lines(myData$DateTime, myData$Sub_metering_3, type="l", col="blue")
    #Creation and placement of legend
	cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
    #PNG Graphics device closed  
	dev.off()
	
	
	
}