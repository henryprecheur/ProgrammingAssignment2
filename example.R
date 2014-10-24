source("cachematrix.R")

# Create a cache matrix
x = makeCacheMatrix(matrix(rnorm(16), nrow=4))
# uncomment this line for a loooong inversion to see the difference
x = makeCacheMatrix(matrix(rnorm(1000 * 1000), nrow=1000))

# Compute inverse here, long calculation
c1 <- cacheSolve(x)

# Use the cached value, saving a bunch of time
c2 <- cacheSolve(x)
