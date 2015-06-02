# ============
setwd("C:\\Users\\João\\Documents\\Coursera\\4.exdata\\ExData_Plotting1\\")

vars <- colnames(read.table("household_power_consumption.txt", nrow = 1, sep = ";", header = TRUE))
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
                   na.strings = "?", sep = ";", col.names = vars)

# head(data); tail(data)

# ==============

png("plot1.png")
with(data,hist(Global_active_power, col = "red",
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"))
dev.off()
