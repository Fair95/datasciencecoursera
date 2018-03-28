Names <- read.table("household_power_consumption.txt",nrows = 1,sep = ";",header = TRUE)
dat <- read.table("household_power_consumption.txt",skip = 66637 ,nrows = 2880, sep = ";", na.strings = "?", col.names = names(Names))



timeline <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
with(dat,plot(timeline,Global_active_power,"l"))
with(dat,plot(timeline,Voltage,"l",xlab = "datetime"))
with(dat,{
  plot(timeline,Sub_metering_1,col="black","l",ylab = "Energy sub metering")
  lines(timeline,Sub_metering_2,col="red")
  lines(timeline,Sub_metering_3,col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col = c("black","red","blue"),
         lty = c(1,1,1),cex = 0.5,bty = "n")
})
with(dat,plot(timeline,Global_reactive_power,"l",xlab = "datetime"))
dev.copy(png,file = "plot4.png",height = 480, width = 480)
dev.off()