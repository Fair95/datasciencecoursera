wk3_4Q1 <- function(){
  if (!file.exists("./wk3_4")){dir.create("./wk3_4")}
  fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileurl,destfile = "./wk3_4/Q1.csv",method = "curl")
  dat <- read.csv("./wk3_4/Q1.csv")
  res <- strsplit(names(dat),"wgtp")
  res[[123]]
}

wk3_4Q2 <- function(){
  if (!file.exists("./wk3_4")){dir.create("./wk3_4")}
  fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileurl,destfile = "./wk3_4/Q2.csv",method = "curl")
  dat <- read.csv("./wk3_3/Q3_1.csv",nrows = 191, skip = 3)
  dat <- dat[,c(1:2,4:5)]
  names(dat) <- c("CountryCode","Ranking","Country","GDP")
  dat$GDP <- gsub(",","",dat$GDP)
  mean(as.integer(dat$GDP),na.rm = T)
}

wk3_4Q4 <-function(){
  if (!file.exists("./wk3_4")){dir.create("./wk3_4")}
  fileurl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  fileurl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileurl1,destfile = "./wk3_4/Q4_1.csv",method = "curl")
  download.file(fileurl2,destfile = "./wk3_4/Q4_2.csv",method = "curl")
  dat1 <- read.csv("./wk3_4/Q4_1.csv",nrows = 191, skip = 3)
  dat1 <- dat1[,c(1:2,4:5)]
  names(dat1) <- c("CountryCode","Ranking","Country","GDP")
  dat2 <- read.csv("./wk3_4/Q4_2.csv")
  dat3 <- merge(dat1,dat2,by.x = "CountryCode",by.y = "CountryCode",all=FALSE)
  sum(grepl("Fiscal year end: June",dat3$Special.Notes))
}

wk3_4Q5 <- function(){
  library(quantmod)
  amzn = getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes = index(amzn)
  formatted = format(sampleTimes,"%A %m %Y")
  sum(grepl("2012",sampleTimes))
  sum(grepl("Monday(.*)2012",formatted))
}