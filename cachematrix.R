##
## makeCacheMatrix return a matrix than can cache its inverse with cacheSolve.
## It works like this:
##
##      # Create the cache matrix
##      x = makeCacheMatrix(matrix(rnorm(1000 * 1000), nrow=1000))
##
##      # Compute inverse
##      c1 <- cacheSolve(x)
##
##      # Use the cached value calculated at the previous line
##      c2 <- cacheSolve(x)
##


##
## Return a inverse-cachable matrix, uses x as its source.
##
makeCacheMatrix <- function(x = matrix()) {
        # cached inverse matrix or null if the inverse wasn't computed
        i <- NULL

        # This sets x to y, and i the inverse matrix to null, since y is a new
        # matrix.
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) i <<- inv
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


##
## Return a matrix that's the inverse of 'x', or a cached value if the
## cacheSolve was previously called with x.
##
cacheSolve <- function(x, ...) {
        i <- x$getinverse()

        # If i isn't null, it means we have already computed the inverse.
        #
        # Return the cached value and chill out a bit because we saved a ton of
        # time.
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }

        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
