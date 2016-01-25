# test2

test_vector <- 'defined in global env'

generate_functions <- function(){
  test_vector <- 'defined in generate function'
some_func <- function(){
  result <<- test_vector
  return(result)
}
return(list(some_func_alias = some_func))
}

trial_1 <- generate_functions()
print(trial_1$some_func_alias())