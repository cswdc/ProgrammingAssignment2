## Two functions and one piece of sample running results are included in this file.

## 1. Function "makeCacheMatrix" creates a list containing a function to

## 1). Set the value of the matrix;
## 2). Get the value of the matrix;
## 3). Set the value of inverse;
## 4). Get the value of inverse.

makeCacheMatrix <- function(x = matrix()) {
	
	inv <- NULL

	set <- function(y){

		x <<- y 
		
		inv <<- NULL

	}
	
	get <- function() x
	
	setinverse <- function(inverse) inv <<- inverse

	getinverse <- function() inv

	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## 2. Funciont "cacheSolve" returns the inverse of the matrix.
## It first checks to see if the inverse of the matrix has already been calculated.
## If so, it gets the inverse of the matrix from the cache and skips the computation.
## Otherwise, it returns the inverse of the matrix and sets the value in the cache. 
## But it doesn't check if the matrix is the invertible one, which is not required in this assignment.

cacheSolve <- function(x, ...) {

	inv <- x$getinverse()

	if(!is.null(inv)){

		message("getting cached inverse of the matrix")

		return(inv)
		
	}

	data <- x$get()

	inv <- solve(data)

	x$setinverse(inv)
	
	inv

}

## 3. Sample Running Results.

## Create an invertible matrix.
## > x <- rbind(c(1,2),c(-1,3))
## > x
##     [,1] [,2]
## [1,]    1    2
## [2,]   -1    3

## Use Function "makeCacheMatrix" with the parameter of the above created matrix x.
## > inv = makeCacheMatrix(x)
## > inv$get()
##     [,1] [,2]
## [1,]    1    2
## [2,]   -1    3

## First run of getting the inverse of the matrix. (not from cached data).
## > cacheSolve(inv)
##     [,1] [,2]
## [1,]  0.6 -0.4
## [2,]  0.2  0.2

## Second run of getting the inverse of the matrix. (It return the data from the cacth)
## > cacheSolve(inv)
## getting cached inverse of the matrix
##    [,1] [,2]
## [1,]  0.6 -0.4
## [2,]  0.2  0.2
## >