Names <- read.table("household_power_consumption.txt",nrows = 1,sep = ";",header = TRUE)
dat <- read.table("household_power_consumption.txt",skip = 66637 ,nrows = 2880, sep = ";", na.strings = "?", col.names = names(Names))


timeline <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
with(dat,plot(timeline,Global_active_power,"l",ylab = "Golobal active power (kilowatts)"))
dev.copy(png,file = "plot2.png",height = 480, width = 480)
dev.off()