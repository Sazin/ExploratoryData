##read data into memory
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##combine date and time columns
data$DateTime <-paste(data$Date, data$Time, sep = "/")

##coerce Date column to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##subset by dates (2007-02-01 and 2007-02-02)
data2<-subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

##coerce DateTime column to POSIXlt
data2$DateTime <- strptime(data2$DateTime, "%d/%m/%Y/%H:%M:%S")

##create line chart of global active power
with(data2, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)",
                 type="n")) 
lines(data2$DateTime, data2$Global_active_power, yaxt = "n")

##copy plot to png file
dev.copy(png, file="plot2.png")