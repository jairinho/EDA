#set working directory
setwd("C:/EDA")
#Read file
data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = "character")
#subset two days
dataTwoDays <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")

#Transform text date to date
dataTwoDays$Date <- as.Date(paste(dataTwoDays$Date,dataTwoDays$Time),format ="%d/%m/%Y")

png("plot4.png", width = 480, height = 480)

#define frame 2 x 2
old.par <- par(mfrow=c(2, 2))

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),dataTwoDays$Global_active_power,type="l"
     ,ylab="G A Power",xlab="Date")

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),dataTwoDays$Voltage,type="l"
     ,ylab="Voltage",xlab="Date")

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_1),col='blue',type="l",ylab="Energy Sub metering",xlab="")
  lines(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_2),col="red",lwd=2.5)
  lines(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),as.numeric(dataTwoDays$Sub_metering_3),col="green",lwd=2.5)

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),dataTwoDays$Global_reactive_power,type="l"
     ,ylab="G R Power",xlab="Date")
par(old.par)
dev.off()