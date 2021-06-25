## Functions that can cache the inverse of a matrix.
##  This function creates a special "matrix" object that can cache its inverse.

## Restoring or caching the inverse of a matrix using functions

makeCacheMatrix <- function(x = matrix()) {
inv<- NULL
set <- function (y) {
x<<-y
inv<<- NULL


}

get<-function()x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
list(set = set,get = get,setInverse = setInverse,getInverse = getInverse)
}



## Solve function registers the inverse of the special "matrix" restored by makeCacheMatrix. 
When the inverse has been computed, the cacheSolve recovers the inverse out of the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv <- x$getInverse()
if (!is.null(inv)) {	
message("getting cached data")
return(inv)}
mat <- x$get()
inv <- solve(mat, ...)
x$setInverse(inv)
inv}

