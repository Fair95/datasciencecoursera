complete <- function(directory, id = 1:332){
  files = list.files(path = directory, pattern="*.csv",full.names = T)
  dat <- data.frame()
  table = data.frame()
  for (i in id){
    dat<- read.csv(files[i])
    nobs = sum(complete.cases(dat))
    table = rbind(table,c(i,nobs))
    names(table) <- c("id","nobs")
  }
  table
}