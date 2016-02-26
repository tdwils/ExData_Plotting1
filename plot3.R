# Plot 3


# Read in data set
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Use data only from the dates "1/2/2007" and "2/2/2007"
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

# The data to plot: Sub_metering_1, 2, and 3
sub1 <- data[subset, "Sub_metering_1"]
sub2 <- data[subset, "Sub_metering_2"]
sub3 <- data[subset, "Sub_metering_3"]

# Combine date and time information in one variable
datetime <- paste(data[subset, "Date"], data[subset, "Time"])
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Open png device; create 'plot1.png'in working directory
png(file = "plot3.png", width = 480, height = 480)

# Create line plot
# Format y axis; accept default for x axis

par(ps = 12)  # Character height for labels
plot(datetime, sub1, type = "l",
     xlab = "", ylab = "Energy sub metering",
     ylim = c(0, 40), yaxp = c(0, 30, 3),   
     axes = TRUE)
lines(datetime, sub2, lty = 1, col = "red")
lines(datetime, sub3, lty = 1, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close png file device
dev.off()

