
hpc_data_lines <- readLines("./data/household_power_consumption.txt")
date_filter <- grep("[1-2]/2/2007", substr(hpc_data_lines, 1,8))  # a numeric vector
hpc_data <- read.table(text=hpc_data_lines[date_filter], header = TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

datetime = as.POSIXct(paste(hpc_data$Date, hpc_data$Time), format="%d/%m/%Y %H:%M:%S")

energy_sub_metering = hpc_data$Sub_metering_1 + hpc_data$Sub_metering_2 + hpc_data$Sub_metering_3

with(hpc_data, {plot(datetime, Global_active_power, type = 'l', xlab="", ylab="Global Active Power (kilowatts)")
                plot(datetime, Voltage, type = 'l', xlab="datetime", ylab="Voltage")
                plot(datetime, energy_sub_metering, type = 'n', xlab="", ylab="Energy sub metering")
                lines(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering",col="black")
                lines(datetime, Sub_metering_2, xlab="", ylab="Energy sub metering",col="red")
                lines(datetime, Sub_metering_3, xlab="", ylab="Energy sub metering",col="blue")
                legend("topright", lty=1, cex=0.8, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(datetime, Global_reactive_power, type = 'l', xlab="datetime", ylab="Global_reactive_power")
     
     })

dev.off()