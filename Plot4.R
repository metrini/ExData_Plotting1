##Function reads in "household_power_consumption.txt",
##Creates a subset between Date "1/2/2007" to "2/2/2007"
##Creats and adds Data/Time to subset
##Saves Plot to PNG

plot4<- function(){
	#Read in txt file 
	myData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses=c("character","character",rep("numeric",7)), na.strings="?")
	#Subset of entire dataset
	myData<-myData[(myData$Date == "1/2/2007") | (myData$Date == "2/2/2007"),]
	#Date/Time column created and added to subset
	myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S") 
	
	#PNG Graphic device opened
	png(filename = "plot4.png", width = 480, height = 480, units = "px")
    #Paramters set for 2x2 graph
    par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    with(myData, {
		#Plot at row 1 col 1 
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        #Plot at row 1 col 2
		plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        #Plot at row 2 col 1 
        cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
        #Plot at row 2 col 2 
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
    })
	#PNG Graphics device closed    
    dev.off()
	
	
}