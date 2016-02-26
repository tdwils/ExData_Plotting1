# Plot 1

# Read in data set
data <- read.table("household_power_consumption.txt", sep = ";", 
                   header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Use data only from the dates "1/2/2007" and "2/2/2007"
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"

# The data to plot, in kilowatts
power <- as.numeric(data[subset, "Global_active_power"])

# Open png device; create 'plot1.png'in working directory
png(file = "plot1.png", width = 480, height = 480)

# Create plot

par(ps = 12)  # Character height for labels
hist(power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     xlim = c(0, 7), axes = FALSE)
axis(side = 1, at = seq(0, 6, 2))
axis(side = 2, at = seq(0, 1200, 200))

# Close png file device
dev.off()

