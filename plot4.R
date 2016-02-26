# Plot 4


# Read in data set
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Use data only from the dates "1/2/2007" and "2/2/2007"
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

# The data to plot: Global active power
activepower <- as.numeric(data[subset, "Global_active_power"])

# The data to plot: Voltage
voltage <- as.numeric(data[subset, "Voltage"])

# The data to plot: Sub_metering_1, 2, and 3
sub1 <- data[subset, "Sub_metering_1"]
sub2 <- data[subset, "Sub_metering_2"]
sub3 <- data[subset, "Sub_metering_3"]

# The data to plot: Global reactive power
reactivepower <- as.numeric(data[subset, "Global_reactive_power"])

# Combine date and time information in one variable
datetime <- paste(data[subset, "Date"], data[subset, "Time"])
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Open png device; create 'plot1.png'in working directory
png(file = "plot4.png", width = 480, height = 480)

# Create plots in a 2 x 2 arrangement
par(mfrow = c(2, 2))

# Plot 1
par(ps = 12)  # Character height for labels
plot(datetime, activepower, type = "l",
     xlab = "", ylab = "Global Active Power",
     ylim = c(0, 7.5), yaxp = c(0, 6, 3),   
     axes = TRUE)

# Plot 2
#par(ps = 12)  # Character height for labels
plot(datetime, voltage, type = "l",
     xlab = "datetime", ylab = "Voltage",
     yaxs = "r", ylim = c(234, 246),    
     axes = TRUE)

# Plot 3
par(ps = 12)  # Character height for labels
plot(datetime, sub1, type = "l",
     xlab = "", ylab = "Energy sub metering",
     ylim = c(0, 40), yaxp = c(0, 30, 3),   
     axes = TRUE)
lines(datetime, sub2, lty = 1, col = "red")
lines(datetime, sub3, lty = 1, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
par(ps = 12)  # Character height for labels
plot(datetime, reactivepower, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power",
     yaxs = "r", yaxp = c(0, 0.5, 5),   
     axes = TRUE)

# Close png file device
dev.off()

