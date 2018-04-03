setwd("~/Desktop/Coursera Datascience")
rm(list = ls())
library(ggplot2)
library(reshape2)
if (!file.exists("./wk4_4")) {dir.create("./wk4_4")}
if (!file.exists("./wk4_4/data.zip")){
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileurl,destfile <- "./wk4_4/data.zip",method = "curl",mode = "wb")
  unzip("./wk4_4/data.zip",exdir = "./wk4_4")
}

## Read raw data
NEI <- readRDS("./wk4_4/summarySCC_PM25.rds")
SCC <- readRDS("./wk4_4/Source_Classification_Code.rds")

datsub <- subset(NEI,fips == "24510")

yearsum <- as.data.frame(sapply(split(datsub,datsub$type),function(x) {with(x,tapply(Emissions,year,sum,rm.na=TRUE))}))
M<- melt(yearsum)
xlabels = rep(dimnames(yearsum)[[1]],4)

## A nice and easy way
## ggplot(data = datsub, aes(x=year,y=Emissions))
## +stat_summary(fun.y="sum",geom="bar")
## +facet_grid(.~type)

g <- ggplot(M,aes(x = xlabels,y = M$value))
g + geom_bar(stat="identity")+facet_wrap(~variable) + labs(x = "Year",y = "Total Emissions (tons)")

dev.copy(png,file = "./wk4_4/plot3.png",height = 480,width = 480)
dev.off()
