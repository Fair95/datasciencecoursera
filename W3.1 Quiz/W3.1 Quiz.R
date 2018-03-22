Q1 <- function(){
  fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileurl,destfile = "Q1.csv",method = "curl")
  Data <- read.csv("Q1.csv")
  sum(Data["VAL"]==24,na.rm = T)
}
Q3 <-function(){
  library(openxlsx)
  fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileurl,destfile = "Q3.xlsx",method = "curl")
  dat <- read.xlsx("Q3.xlsx",rows=18:23,cols=7:15)
  sum(dat$Zip*dat$Ext,na.rm=T)
}
Q4 <-function(){
  library(XML)
  fileurl = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  dat <- xmlTreeParse(fileurl,useInternalNodes = TRUE)
  rootNode <- xmlRoot(dat)
  sum(xpathSApply(rootNode,"//zipcode",xmlValue)==21231,na.rm=TRUE)
}

Q5 <- function(){
  library(data.table)
  fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileurl,destfile = "Q5.csv",method = "curl")
  DT = fread("Q5.csv")
}