# Plot 2


# Read in data set
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Use data only from the dates "1/2/2007" and "2/2/2007"
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

# The data to plot: Global active power
power <- as.numeric(data[subset, "Global_active_power"])

# Combine date and time information in one variable
datetime <- paste(data[subset, "Date"], data[subset, "Time"])
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Open png device; create 'plot1.png'in working directory
png(file = "plot2.png", width = 480, height = 480)

# Create line plot
# Format y axis; accept default for x axis

par(ps = 12)  # Character height for labels
plot(datetime, power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)",
     ylim = c(0, 7.5), yaxp = c(0, 6, 3),   
     axes = TRUE)

# Close png file device
dev.off()

