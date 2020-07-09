
hpc_data_lines <- readLines("./data/household_power_consumption.txt")
date_filter <- grep("[1-2]/2/2007", substr(hpc_data_lines, 1,8))  # a numeric vector
hpc_data <- read.table(text=hpc_data_lines[date_filter], header = TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(file="plot1.png", width=480, height=480)

with(hpc_data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

dev.off()
