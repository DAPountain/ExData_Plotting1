#load the data from the file
power <- read.csv("household_power_consumption.txt", header=TRUE, na.strings='?', sep=';')

#Combine the date and time columns so the we can more easily filter
power$DateTime <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
#Filter data set, retaining only rows relevant for our study
power <- power[power$DateTime>='2007-02-01' & power$DateTime<'2007-02-03',]

#Open the PNG device
png(filename = "Plot1.png", width = 480, height = 480 )

hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

#Close the device
dev.off()
     
     
     

