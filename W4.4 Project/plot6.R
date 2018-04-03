setwd("~/Desktop/Coursera Datascience")
rm(list = ls())
if (!file.exists("./wk4_4")) {dir.create("./wk4_4")}
if (!file.exists("./wk4_4/data.zip")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl,destfile <- "./wk4_4/data.zip",method = "curl",mode = "wb")
  unzip("./wk4_4/data.zip",exdir = "./wk4_4")
}

## Read raw data
NEI <- readRDS("./wk4_4/summarySCC_PM25.rds")
SCC <- readRDS("./wk4_4/Source_Classification_Code.rds")

ind <- grep("highway veh",SCC$Short.Name,ignore.case = TRUE)

Code<- SCC$SCC[ind]

datsub1 <- subset(subset(NEI,SCC %in% Code), fips == "24510")
year_sum1 <- with(datsub1,tapply(Emissions,year,sum,rm.na = TRUE))

datsub2 <- subset(subset(NEI,SCC %in% Code), fips == "06037")
year_sum2 <- with(datsub2,tapply(Emissions,year,sum,rm.na = TRUE))

years <- dimnames(year_sum1)[[1]]
upper <- max(year_sum2)
lower <- min(year_sum1)
plot(years,year_sum1,main = "Comparison between Baltimore City and Los Angeles City",xlab = "Year",ylab = "Total PM2.5 Emissions (tons)",col = "red","l",ylim=c(lower,upper))
par(new=T)
plot(years,year_sum2,main = "Comparison between Baltimore City and Los Angeles City",xlab = "Year",ylab = "Total PM2.5 Emissions (tons)",col = "blue","l",ylim=c(lower,upper))
legend("right",legend = c("Baltimore City","Los Angeles City"),
       col = c("red","blue"),
       lty = c(1,1))
dev.copy(png,file = "./wk4_4/plot6.png",height = 480,width = 480)
dev.off()