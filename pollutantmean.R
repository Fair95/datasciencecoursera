## combine all csv files then use %in% to locate rows specified by the input id
pollutantmean <- function(directory, pollutant, id = 1:332){
  files = list.files(path = directory, pattern="*.csv",full.names = T)
  fileFrame <- do.call(rbind,lapply(files,read.csv)) 
  
  monitor = fileFrame[which(fileFrame$ID %in% id ),]
  mean(monitor[,pollutant],na.rm = T)
}
## Alternatily only read the csv file which is specified by the input id
pollutantmean2 <- function(directory, pollutant, id = 1:332){
  files = list.files(path = directory, pattern="*.csv",full.names = T)
  dat <- data.frame()
  for (i in id){
    dat <- rbind(dat,read.csv(files[i]))
  }
  mean(dat[,pollutant],na.rm = T)
}
