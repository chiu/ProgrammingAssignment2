## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inverse_result <- NULL  # a dummy variable for caching the result
  set <- function(y) {
    x <<- y
    inverse_result <<- NULL
  }
  get <- function(){
    return(x)
  }
  SetInverseResult <- function(inverse_result_arg) {
    inverse_result <<- inverse_result_arg
  }
  GetInverseResult <- function() {
    return(inverse_result)
  }
  result <-
    list(
      set = set, get = get, SetInverseResult = SetInverseResult, GetInverseResult = GetInverseResult
    )
  return(result)
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse_result <- x$GetInverseResult()
  
  if (!is.null(inverse_result)) {
    message('getting cached data')
    return(inverse_result)
  }
  data <- x$get()
  inverse_result <- solve(data)
  x$SetInverseResult(inverse_result)
  return(inverse_result)
}

# some_matrix = matrix( c(2, 4, 3, 1, 5, 7, 1 , 2, 3), nrow=3,   ncol=3)
# 
# matrix_functions <- makeCacheMatrix(some_matrix)
# time_start <- Sys.time()
# cache_solve_output <- cacheSolve(matrix_functions)
# time_end <- Sys.time()
# time_diff <- time_end - time_start
# print(paste0('for non caching; time diff is:', time_diff))
# 
# time_start <- Sys.time()
# cache_solve_output <- cacheSolve(matrix_functions)
# time_end <- Sys.time()
# time_diff <- time_end - time_start
# print(paste0('for caching time diff is:', time_diff))