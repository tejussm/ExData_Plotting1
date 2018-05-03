# Data Science Course 4 - Eploratory Data Analysis - Assigntment 1.4: plot4.R and plot4.png
# Pre-steps: 
# (1) Download and unzip the data file by cliking the link
# (2) Move unzipped file to "Data" folder on the PC
# Read data file into dataframe, PC (PowerConsumption):
PC <- read.table("household_power_consumption.txt", header = T, sep = ";")

# Subset PC for Feb 1 and Feb 2, 2007 rows
PC2 <- PC[PC$Date %in% c("1/2/2007", "2/2/2007"), ]

# Reformat Date column, and convert other columns to numeric
PC2$Date <- as.Date(PC2$Date, format="%d/%m/%Y")
PC2$Global_active_power <- as.numeric(as.character(PC2$Global_active_power))
PC2$Global_reactive_power <- as.numeric(as.character(PC2$Global_reactive_power))
PC2$Global_intensity <- as.numeric(as.character(PC2$Global_intensity))
PC2$Voltage <- as.numeric(as.character(PC2$Voltage))
PC2$Sub_metering_1 <- as.numeric(as.character(PC2$Sub_metering_1))
PC2$Sub_metering_2 <- as.numeric(as.character(PC2$Sub_metering_2))
PC2$Sub_metering_3 <- as.numeric(as.character(PC2$Sub_metering_3))

# Merge Date and Time columns and reformat to POSIXct for use as plot axis. Save results in new dataframe:
PC3 <- transform(PC2, timestamp = as.POSIXct(paste(Date, Time)))

# Construct plot 4 and write to png file:
par(mfrow = c(2,2))
plot(PC3$timestamp, PC3$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
plot(PC3$timestamp, PC3$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(PC3$timestamp, PC3$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(PC3$timestamp, PC3$Sub_metering_2, col="red")
lines(PC3$timestamp, PC3$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),
lty=c(1,1), bty="n", cex=.5)
plot(PC3$timestamp, PC3$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_Reactive_Power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off() 