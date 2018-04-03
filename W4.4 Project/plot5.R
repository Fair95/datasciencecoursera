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

datsub <- subset(subset(NEI,SCC %in% Code), fips == "24510")
year_sum <- with(datsub,tapply(Emissions,year,sum,rm.na = TRUE))

barplot(year_sum,main = "Total PM2.5 emission of motor vehicle in Baltimore City vs Year",xlab = "Year",ylab = "Total PM2.5 Emissions (tons)",col = "red")

dev.copy(png,file = "./wk4_4/plot5.png",height = 480,width = 480)
dev.off()