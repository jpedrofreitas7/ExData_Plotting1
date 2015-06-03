# ============
setwd("C:\\Users\\João\\Documents\\Coursera\\4.exdata\\ExData_Plotting1\\")

vars <- colnames(read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE))
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                   na.strings = "?", sep = ";", col.names = vars)
# head(data); tail(data)

datetime <- strptime(with(data, sprintf("%s %s", Date, Time)), "%d/%m/%Y %H:%M:%S")

# ==============
Sys.setlocale("LC_TIME", "English")

png("plot4.png")
par(mfrow=c(2,2))
with(data,{plot(datetime, Global_active_power, type = "l",
               main = "",
               ylab = "Global Active Power (kilowatts)",
               xlab = "")
           plot(datetime, Voltage, type = "l",
                              main = "",
                              ylab = "Voltage")
           plot(datetime, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab="")
           lines(datetime, Sub_metering_2, type = "l", col = "red")
           lines(datetime, Sub_metering_3, type = "l", col = "blue")
           legend(x = "topright",
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  col=c("black","red", "blue"), lty = 1, bty = "n")
           plot(datetime, Global_reactive_power, type = "l",
                main = "")
           })
dev.off()