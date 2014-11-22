makecacheMatrix = function(x = Matrix()){ ## set x as a matrix 
    inverse = NULL ## inverse is the inverse matrix of x
                   ## inverse is set to NULL when the function is run   
    set = function(y){
        x <<- y
        inverse <<- NULL
    }
    get = function() x ## read x
    setinverse = function(solve) inverse <<- solve
    getinverse = function() inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve = function(x, ...){
    inverse = x$getinverse() ## read the inverse matrix
    if(!is.null(inverse)){   ## if there is an inverse matrix in the cache
        message("getting cached data")  ## then write the message
        return(inverse)   ## write down the inverse matrix
    }
    data = x$get() ## if there is no inverse matrix in cache
    inverse = solve(data, ...) ## then set inverse as the inverse matrix of x
    x$setinverse(inverse) ## write inverse into the cache
    inverse ## write down inverse matrix
}
