
#The following functions are used to create a special object that stores a matrix and caches its inverse. The first function, createCacheMatrix creates a special #matrix, which is really a list containing a function to:
#1.get the value of the matrix
#2.set the value of the inverse
#3.get the value of the inverse


makeCacheMatrix <- function(z = matrix()) {
  i <<- NULL

  get1 <- function()
	{ 
		z
	}
  setinverse1 <- function(inverse)
	{
		i <<- inverse
	}
  getinverse1 <- function() 
	{
 		i
	}
  list(
       get0 = get1,
       setinverse0 = setinverse1,
       getinverse0 = getinverse1)
}

#This function computes the inverse of the special “matrix” returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not #changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  cachedData <- x$getinverse0()
    if (!is.null(cachedData)) {
          message("get cached data")
          return(cachedData)
  }
  data <- x$get0()
  message("getting inverse matrix")
  cachedData <- solve(data, ...)
  message("setting inverse matrix")
  x$setinverse0((cachedData))
  return(cachedData)
}
