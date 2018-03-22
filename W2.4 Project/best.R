outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

best <- function(state, outcome){
  ## Read outcome data
  raw_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  cand <- raw_data[,c(2,7,11,17,23)]
  names(cand) <- c("HospitalName","State","heart attack","heart failure","pneumonia")
  ## Check that state and outcome are valid
  if (!outcome %in% names(cand)[3:5]){
    stop("invalid outcome")
  }else if(!state %in% cand[["State"]]){
    stop("invalid State")
  }else{
    ## Return hospital name in that state with lowest 30-day death
    filter1 = cand[cand["State"]==state,]
    filter2 = filter1[complete.cases(as.numeric(filter1[[outcome]])),]
    sorted = filter2[order(filter2$State),]
    top = which.min(sorted[[outcome]])
  }
  sorted[["HospitalName"]][top]
  
  ## rate
}
