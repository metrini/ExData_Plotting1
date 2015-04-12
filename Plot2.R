##Function reads in "household_power_consumption.txt",
##Creates a subset between Date "1/2/2007" to "2/2/2007"
##Creats and adds Data/Time to subset
##Saves Plot to PNG
plot2<- function(){
	#Read in txt file 
	myData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character","character",rep("numeric",7)), na.strings="?")
	#Subset of entire dataset
	myData<-myData[(myData$Date == "1/2/2007") | (myData$Date == "2/2/2007"),]
	#Date/Time column created and added to subset
	myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")

	#PNG Graphic device opened
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(myData$DateTime, myData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
   	#PNG Graphics device closed    
	dev.off()
	
	
	
}