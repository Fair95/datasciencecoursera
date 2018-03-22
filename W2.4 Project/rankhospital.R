rankhospital <- function(state, outcome, num = "best") {
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
    ## Return hospital name in that state with the given rank
    filter1 = cand[cand["State"]==state,]
    filter2 = filter1[complete.cases(as.numeric(filter1[[outcome]])),]
    sorted = filter2[order(as.numeric(filter2[[outcome]]),filter2$HospitalName),]
    if(num == "best"){
      res <- 1
    }else if(num == "worst"){
      res <- nrow(sorted)
    }else if(is.na(as.numeric(num))){
      stop("invalid num")
    }else{
      res <- as.numeric(num)
    }
  }
  sorted[["HospitalName"]][res]
  ## 30-day death rate
}