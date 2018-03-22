## These function aim to make fully use of the nature of lexical
## scoping which eables the possibility to read variables that 
## are already stored in cache

## This function creates a special "matrix" which is really a
## list containing functions to 1. set the value of the matrix
## 2. get the value of the matrix 3. set the value of the 
## corresponding inversed matrix 4. get the value of the 
## corresponding inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  inv<- matrix()
  ## Note that <<- is uese so that the assignment can be done even
  ## in other enviroment
  set <- function(y){
    x <<- y
    inv <<- matrix()
  }
  get <- function() x
  setinv <- function(inversed) inv <<- inversed
  getinv <- function() inv
  list (set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function will directly return the inverse of a give
## matrix 'x' if it has been calculated before and stored in 
## cache, otherwise it calculates the inverse of 'x'

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  ## Check if the matrix is empty, if not, print the message to
  ## indicate the value is directed return from cache
  if(!is.na(inv[1])){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data,...)
  x$setinv(inv)
  inv
}

