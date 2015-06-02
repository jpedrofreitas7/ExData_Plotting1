# ============
setwd("C:\\Users\\João\\Documents\\Coursera\\4.exdata\\ExData_Plotting1\\")

vars <- colnames(read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE))
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                   na.strings = "?", sep = ";", col.names = vars)

head(data); tail(data)
datetime <- strptime(with(data, sprintf("%s %s", Date, Time)), "%d/%m/%Y %H:%M:%S")

# ==============
Sys.setlocale("LC_TIME", "English")

png("plot3.png")
with(data, plot(datetime, Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab=""))
# par(new=TRUE)
with(data, lines(datetime, Sub_metering_2, type = "l", col = "red"))
# par(new=TRUE)
with(data, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty = 1)
dev.off()

