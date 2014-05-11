##Read in the data set
file<-"./data/household_power_consumption.txt"
hpc<-read.csv(file,header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

##Convert Date Variable
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")

##Subset data from the dates 2007-02-01 and 2007-02-02
hpcNew<-subset(hpc,Date>="2007-02-01" & Date<="2007-02-02")

##Create a histogram
png("plot1.png", width = 480, height = 480) #Opens the png device
hist(hpcNew$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off() #Closes the png device