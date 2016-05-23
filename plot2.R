# Plot 2: Global Active Power

setwd("/Users/Sara/Documents/Coursera")

# Read in data table
powerData <- read.table(unzip("exdata-data-household_power_consumption.zip"), header = TRUE, sep = ";",
                        col.names = c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"),
                        na.strings = "?", skipNul = TRUE)

# Subset data from Feb 1, 2007 - Feb 3, 2007

febData <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007")

datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(febData$GlobalActivePower)
plot2 <- plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width=480, height=480)
plot(plot2)
dev.off()
