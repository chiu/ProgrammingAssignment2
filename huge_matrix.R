library(MASS)
source('cachematrix.R')

k   <- 2000
rho <- .3

S       <- matrix(rep(rho, k*k), nrow=k)
diag(S) <- 1

dat <- mvrnorm(10000, mu=rep(0,k), Sigma=S) ### be patient!

R <- cor(dat)

matrix_functions <- makeCacheMatrix(R)
time_start <- Sys.time()
system.time(result1 <- cacheSolve(matrix_functions))
time_end <- Sys.time()
time_diff <- time_end - time_start
print(paste0('for non caching; time diff is:', time_diff))

time_start <- Sys.time()
system.time(result2 <- cacheSolve(matrix_functions))
time_end <- Sys.time()
time_diff <- time_end - time_start
print(paste0('for caching; time diff is:', time_diff))

# system.time(RI1 <- solve(R))
# system.time(RI2 <- chol2inv(chol(R)))
# system.time(RI3 <- qr.solve(R))
# 
# all.equal(RI1, RI2)
# all.equal(RI1, RI3)