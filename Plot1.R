##Function reads in "household_power_consumption.txt",
##Creates a subset between Date "1/2/2007" to "2/2/2007"
##Saves Histogram Plot to PNG

plot1<- function(){
	#Read in txt file 
	myData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character","character",rep("numeric",7)), na.strings="?")
	#Subset of entire dataset
	myData<-myData[(myData$Date == "1/2/2007") | (myData$Date == "2/2/2007"),]
	#PNG Graphic device opened
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
    hist(myData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    #PNG Graphics device closed 
	dev.off()
	
	
	
}