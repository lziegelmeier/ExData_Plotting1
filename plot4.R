##Read in the data set
file<-"./data/household_power_consumption.txt"
hpc<-read.csv(file,header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

##Subset data from the dates 1/2/2007 and 2/2/2007
hpcNew<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

##Convert Date and Time Variables
hpcNew$DateTime <- strptime(paste(hpcNew$Date, hpcNew$Time),"%d/%m/%Y %H:%M:%S")
# Create POSIXlt date/time

##Create subplots
png("plot4.png", width = 480, height = 480) #Opens the png device
par(mfrow = c(2,2))
#Top Left Plot
plot(hpcNew$DateTime,hpcNew$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
#Top Right Plot
plot(hpcNew$DateTime,hpcNew$Voltage,xlab="datetime",ylab="Voltage",type="l")
#Bottom Left Plot
plot(hpcNew$DateTime,hpcNew$Sub_metering_1,xlab="",ylab="Enery sub metering",type="l",col="black")
lines(hpcNew$DateTime, hpcNew$Sub_metering_2, col="red")
lines(hpcNew$DateTime, hpcNew$Sub_metering_3, col="blue")
legend("topright", bty = "n",lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Bottom Right Plot
plot(hpcNew$DateTime,hpcNew$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off() #Close the png device