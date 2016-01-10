#load the data from the file
power <- read.csv("household_power_consumption.txt", header=TRUE, na.strings='?', sep=';')

#Combine the date and time columns so the we can more easily filter
power$DateTime <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")
#Filter data set, retaining only rows relevant for our study
power <- power[power$DateTime>='2007-02-01' & power$DateTime<'2007-02-03',]

#Open the PNG device
png(filename = "Plot4.png", width = 480, height = 480 )

par(mfrow = c(2, 2))

#Plot 1
with( power, plot( DateTime,Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))

#Plot 2
with( power, plot( DateTime,Voltage, type='l', xlab="datetime", ylab="Voltage"))

#Plot 3
with( power, plot( DateTime, Sub_metering_1, type='l', xlab="", ylab="Energy sub metering"))
with( power, lines( DateTime, Sub_metering_2, col="red"))
with( power, lines( DateTime, Sub_metering_3, col="blue"))
legend("topright", lwd=c(2.5,2.5,2.5), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Plot 4
with( power, plot( DateTime,Global_reactive_power, type='l', xlab="datetime", ylab="Voltage"))


dev.off()
