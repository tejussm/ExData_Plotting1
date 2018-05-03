# Data Science Course 4 - Eploratory Data Analysis - Assigntment 1.1: plot1.R and plot1.png
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

# Merge Date and Time columns and reformat to POSIXct for use as plot axis:
PC3 <- transform(PC2, timestamp = as.POSIXct(paste(Date, Time)))

# Construct plot 1 and write to png file:
hist(PC3$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()