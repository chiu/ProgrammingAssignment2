library(MASS)
source('cachematrix.R')

k   <- 2000
rho <- .3

S       <- matrix(rep(rho, k*k), nrow=k)
diag(S) <- 1

dat <- mvrnorm(10000, mu=rep(0,k), Sigma=S) ### be patient!

R <- cor(dat)

matrix_functions <- makeCacheMatrix(R)
system.time(result1 <- cacheSolve(matrix_functions))
system.time(result2 <- cacheSolve(matrix_functions))

# system.time(RI1 <- solve(R))
# system.time(RI2 <- chol2inv(chol(R)))
# system.time(RI3 <- qr.solve(R))
# 
# all.equal(RI1, RI2)
# all.equal(RI1, RI3)