corr <- function(directory, threshold = 0){
  files = list.files(path = directory, pattern="*.csv",full.names = T)
  cr <- vector()
  for (i in 1:332){
    dat = complete(directory,i)
    if (dat$nobs > threshold){
      monitor <- read.csv(files[i])
      monitor = monitor[complete.cases(monitor),]
      cr = c(cr,cor(monitor$sulfate,monitor$nitrate))
    }
  }
  cr
}