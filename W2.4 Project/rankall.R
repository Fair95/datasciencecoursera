rankall <- function(outcome, num = "best") {
  ## Read outcome data
  raw_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  cand <- raw_data[,c(2,7,11,17,23)]
  names(cand) <- c("HospitalName","State","heart attack","heart failure","pneumonia")
  ## Check that state and outcome are valid
  if (!outcome %in% names(cand)[3:5]){
    stop("invalid outcome")
  }else{
    filter = cand[complete.cases(as.numeric(cand[[outcome]])),]
    my_sort <- function(x,outcome){
      x[order(as.numeric(x[[outcome]]),x$HospitalName),]
    }
    ## For each state, find the hospital of the given rank
    x = split(filter, filter$State)
    tab <- lapply(x, my_sort,outcome)
    if(num == "best"){
      res <- rep(1,54)
    }else if(num == "worst"){
      for (i in 1:54){
        res[i] <- nrow(tab[[i]]) 
      }
    }else if(is.na(as.numeric(num))){
      stop("invalid num")
    }else{
      res <- rep(as.numeric(num),54)
    }
    
  }
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  ranking = data.frame(HospitalName = character(), State = character(), stringsAsFactors=FALSE)
  for (i in 1:length(names(x))){
    ranking <- rbind(ranking,data.frame(HospitalName = tab[[i]]$HospitalName[res[i]],State = tab[[i]]$State[1],stringsAsFactors=FALSE))
    names(ranking) <- c("HospitalName","State")
  } 
  ranking
}