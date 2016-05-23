# Plot 4: Global Active Power, Voltage, Energy Sub Metering and Global Reactive Power on Thurs, Fri, and Sat

setwd("/Users/Sara/Documents/Coursera")

# Read in data table
powerData <- read.table(unzip("exdata-data-household_power_consumption.zip"), header = TRUE, sep = ";",
                        col.names = c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"),
                        na.strings = "?", skipNul = TRUE)

# Subset data from Feb 1, 2007 - Feb 3, 2007
febData <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007")

# Set up the plot window for four plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(febData$GlobalActivePower)
# First Plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Second Plot
Voltage <- as.numeric(febData$Voltage)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# Third Plot 
subMetering1 <- as.numeric(febData$SubMetering1)
subMetering2 <- as.numeric(febData$SubMetering2)
subMetering3 <- as.numeric(febData$SubMetering3)

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
points(datetime, subMetering2, type="l", col="red")
points(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth Plot
globalReactivePower <- as.numeric(febData$GlobalReactivePower)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()