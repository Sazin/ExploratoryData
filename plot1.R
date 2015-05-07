##read data into memory
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##coerce Date column to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##subset by dates (2007-02-01 and 2007-02-02)
data2<-subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

##create histogram of global active power
hist(data2$Global_active_power, breaks = 15, col="red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##copy plot to png file
dev.copy(png, file="plot1.png")