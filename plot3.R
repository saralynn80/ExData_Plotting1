# Plot 3: Energy Sub Metering

setwd("/Users/Sara/Documents/Coursera")

# Read in data table
powerData <- read.table(unzip("exdata-data-household_power_consumption.zip"), header = TRUE, sep = ";",
                        col.names = c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"),
                        na.strings = "?", skipNul = TRUE)

# Subset data from Feb 1, 2007 - Feb 3, 2007

febData <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007")
datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(febData$SubMetering1)
subMetering2 <- as.numeric(febData$SubMetering2)
subMetering3 <- as.numeric(febData$SubMetering3)


png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
points(datetime, subMetering2, type="l", col="red")
points(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()