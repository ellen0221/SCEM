# 1. create a data frame
animals <- c("Snake", "Ostrich", "Cat", "Spider")
num_legs <- c(0, 2, 4, 8)
animals_df <- data.frame(animals, num_legs)
animals_df

# 2. check and delete objects
?ls
ls()
?rm
rm(num_legs)
ls()
rm(animals, animals_df)

# 3. create a data frame in R scripts
animals <- c("Snake", "Ostrich", "Cat", "Spider")
num_legs <- c(0, 2, 4, 8)
animals_df <- data.frame(animals, num_legs)
animals_df

# 4. create a data frame in R markdown
# see myFirstRMarkdown.Rmd

# 5. matrix operations
?seq
x_vect <- seq(12, 2, -2)
?matrix
X <- matrix(x_vect, 2, 3)
X
Y <- matrix(seq(1, 4), 2, 2)
Y
Z <- matrix(seq(4, 10, 2), 2, 2)
Z
t(Y)
t(Z)
Y + Z
Z + Y
# matrix multiplication
Y %*% Z
Z %*% Y # not commutative
Y %*% X
# matrix element-wise multiplication
Y * Z
# matrix inverse
?solve
solve(Y)
Y %*% solve(Y)
solve(Y) %*% X
# argument b would be taken to be 
# an identity matrix as default
# so, solve(Y) equals Y%*%x = identity martix for x
# with both side multiply X
# which means Y %*% x %*% X = identity martix %*% X
# and it can be transfer like this:
# Y %*% x %*% X = X
# in the left part of the equation, x %*% X equals solve(Y) %*% X and see it as a new x
# then the equation can become this way: Y %*% x = X
# which exactly the same as the equation of solve(Y, X)
# thus solve(Y) %*% X get the same result as solve(Y, X)
solve(Y, X) 

# 6. writing a function within R
myFirstRFunc <- function(n) {
    res <- 0
    for (i in seq(2, n-1)) {
        if (i %% 2 == 0 | i %% 7 == 0) {
            res <- res + i
        }
    }
    return(res)
}
myFirstRFunc(1000)

# 7. further R markdown exercises
# see Assignment1RMarkdown.Rmd

# 8. version control with RStudio and git