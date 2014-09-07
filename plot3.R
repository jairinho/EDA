#set working directory
setwd("C:/EDA")
#Read file
data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = "character")
#subset two days
dataTwoDays <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")

#Transform text date to date
dataTwoDays$Date <- as.Date(paste(dataTwoDays$Date,dataTwoDays$Time),format ="%d/%m/%Y")

png("plot3.png", width = 480, height = 480)

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_1),col='blue',type="l",ylab="Energy Sub metering",xlab="")

lines(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_2),col="red",lwd=2.5)
lines(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_3),col="green",lwd=2.5)

dev.off()