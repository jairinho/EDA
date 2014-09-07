#set working directory
setwd("C:/EDA")
#Read file
data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = "character")
#subset two days
dataTwoDays <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")

#Transform text date to date
dataTwoDays$Date <- as.Date(paste(dataTwoDays$Date,dataTwoDays$Time),format ="%d/%m/%Y")

png("plot2.png", width = 480, height = 480)

plot(as.POSIXct ( paste(dataTwoDays$Date,dataTwoDays$Time)),dataTwoDays$Global_active_power,type="l"
     ,ylab="Global Active Power (kilowatts)",xlab="Date")

dev.off()