##Read in the data set
file<-"./data/household_power_consumption.txt"
hpc<-read.csv(file,header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

##Subset data from the dates 1/2/2007 and 2/2/2007
hpcNew<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

##Convert Date and Time Variables
hpcNew$DateTime <- strptime(paste(hpcNew$Date, hpcNew$Time),"%d/%m/%Y %H:%M:%S")
# Create POSIXlt date/time

##Create a line plot of the sub metering
png("plot3.png", width = 480, height = 480) #Opens the png device
plot(hpcNew$DateTime,hpcNew$Sub_metering_1,xlab="",ylab="Enery sub metering",type="l",col="black")
lines(hpcNew$DateTime, hpcNew$Sub_metering_2, col="red")
lines(hpcNew$DateTime, hpcNew$Sub_metering_3, col="blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() #Closes the png device