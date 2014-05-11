##Read in the data set
file<-"./data/household_power_consumption.txt"
hpc<-read.csv(file,header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")


##Subset data from the dates 2007-02-01 and 2007-02-02
hpcNew<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

##Convert Date and Time Variables
hpcNew$DateTime <- strptime(paste(hpcNew$Date, hpcNew$Time),"%d/%m/%Y %H:%M:%S")
# Create POSIXlt date/time

##Create a line plot of the global active power
png("plot2.png", width = 480, height = 480) #Opens the png device
plot(hpcNew$DateTime,hpcNew$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off() #Closes the png device