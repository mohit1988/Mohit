# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The following two
# functions are used to cache the inverse of matrix.

## makeCacheMatrix creates a list containing a function to
#1. Set the value of matrix
#2. Get the value of matrix
#3. Set the value of inverse of matrix
#4. Get the value of inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- funstion() inv
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# The following function returns the inverse of matrix. It first checks if the inverse has already been computed.
# If so, it gets the result and skips the computation. If not, it computes the inverse, sets the value in the
# cache through setinverse function.

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cache data.")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
}

#Sample Run
# > x <- rbind(c(-3,1),c(1,-3))
# > m <- makeCacheMatrix(x)

# > m$get()
#      [,1] [,2]
# [1,]   -3    1
# [2,]    1   -3

# No cache in the first run
# > cacheSolve(m)
#        [,1]   [,2]
# [1,] -0.375 -0.125
# [2,] -0.125 -0.375

# Retrieving from cache in the second run
# > cacheSolve(m)
# getting cache data.
#        [,1]   [,2]
# [1,] -0.375 -0.125
# [2,] -0.125 -0.375
 


