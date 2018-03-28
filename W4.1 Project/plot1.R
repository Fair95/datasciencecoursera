Names <- read.table("household_power_consumption.txt",nrows = 1,sep = ";",header = TRUE)
dat <- read.table("household_power_consumption.txt",skip = 66637 ,nrows = 2880, sep = ";", na.strings = "?", col.names = names(Names))

with(dat,hist(Global_active_power,ylim = c(0,1200),xlab = "Global active power",main = "Global Active Power",col = "red"))
dev.copy(png,file = "plot1.png",height = 480, width = 480)
dev.off()