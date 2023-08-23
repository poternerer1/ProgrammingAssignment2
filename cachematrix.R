## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function( m = matrix() ) {
    ## Initializing
  i <- NULL
  
  ## Setting 
  set <- function( y ) {
    m <<- y
    i <<- NULL
  }
  
  get <- function() {
    m
  }
  
  ## Setting inverse Matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  getInverse <- function() {
    i
  }

  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  
  ## Uses the previous created function
  m <- x$getInverse()
  
  ## Returns the inverse
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data) %*% data
  
  x$setInverse(m)
  
  ## Return the matrix
  m
}

B <- matrix(1:4,2,2)
B

Bcache<- makeCacheMatrix(B)
cacheSolve(Bcache)

