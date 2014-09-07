#set working directory
setwd("C:/EDA")
#Read file
data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,colClasses = "character")
#filter only two days
dataTwoDays <- subset(data, Date =="1/2/2007" | Date =="2/2/2007")
globalActivePower <-as.numeric(dataTwoDays[,"Global_active_power"])
#open png
png("plot1.png", width = 480, height = 480)
#generate histogram
hist(globalActivePower,main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close png
dev.off()
