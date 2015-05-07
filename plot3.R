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

##create line chart of energy sub metering
with(data2, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering",
                 xlab = " ", type="n")) 
  lines(data2$DateTime, data2$Sub_metering_1, yaxt = "n")
  lines(data2$DateTime, data2$Sub_metering_2, col="red", yaxt = "n")
  lines(data2$DateTime, data2$Sub_metering_3, col="blue", yaxt = "n")
  legend("topright", lty= "solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
 

##copy plot to png file
dev.copy(png, file="plot3.png")