# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixelsí¿¸.ğš™ğš—ğš, etc.

# Plot 1: Global Active Power Histogram
#setwd("/Users/Sara/Documents/Coursera")
# Read in data table
powerData <- read.table(unzip("exdata-data-household_power_consumption.zip"), header = TRUE, sep = ";",
                        col.names = c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"),
                        na.strings = "?", skipNul = TRUE)

# Subset data from Feb 1, 2007 - Feb 2, 2007
febData <- subset(powerData, Date=="1/2/2007" | Date=="2/2/2007")

# Create a histogram
plot1 <- hist(febData$GlobalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Save histogram to a png file called 'plot1.png'
png("plot1.png", width=480, height=480)
plot(plot1)
dev.off()
