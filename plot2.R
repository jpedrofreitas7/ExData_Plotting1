# ============
setwd("C:\\Users\\João\\Documents\\Coursera\\4.exdata\\ExData_Plotting1\\")

vars <- colnames(read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE))
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                   na.strings = "?", sep = ";", col.names = vars)
# head(data); tail(data)

datetime <- strptime(with(data, sprintf("%s %s", Date, Time)), "%d/%m/%Y %H:%M:%S")

# ==============
Sys.setlocale("LC_TIME", "English")

png("plot2.png")
with(data,plot(datetime, Global_active_power, type = "l",
               main = "",
               ylab = "Global Active Power (kilowatts)",
               xlab = ""))
dev.off()

