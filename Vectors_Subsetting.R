#Sequence of Numbers

##########

#For sequence of 1 to 20

1:20

seq(1, 20)

##########

rep(5, times = 20)

rep(5, each = 20)

rep(c(1, 2, 3), times = 3)

rep(c(1, 2, 3), each = 3)

#############################################################

##VECTORS

#The simplest and most common data structure in R is the vector.

#Vectors come in two different flavors: atomic vectors and lists. 
#An atomic vector contains exactly one data type, whereas a list may contain multiple data types.

#In previous lessons, we dealt entirely with numeric vectors, which are one type of atomic vector. Other types of atomic vectors include logical, character, integer, and complex.

################

#LOGICAL VECTORS

#Logical vectors can contain the values TRUE, FALSE, and NA (for 'not available'). These values are generated as the result of logical 'conditions'. Let's experiment with some simple conditions.

#If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or' a.k.a. 'union') or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection'). 
#Lastly, !A is the negation of A and is TRUE when A is FALSE and vice versa.


################

#CHARACTER VECTORS

#Character vectors are also very common in R. Double quotes are used to distinguish character objects, as in the following example.

my_char <- c("My", "name", "is")

# [1] "My"   "name" "is"  

#Right now, my_char is a character vector of length 3. Let's say we want to join the elements of my_char together into one continuous character string (i.e. a character vector of length 1). 
#We can do this using the paste() function.

paste(my_char, collapse = " ")
#[1] "My name is"

#Now add your Name

my_name <- c(my_char, "Jerry")
#[1] "My"    "name"  "is"    "Jerry"

paste(my_name, collapse = " ")
#[1] "My name is Jerry"

#In this example, we used the paste() function to collapse the elements of a single character vector. 
#paste() can also be used to join the elements of multiple character vectors.

#In the simplest case, we can join two character vectors that are each of length 1 (i.e. join two words). Try paste("Hello", "world!", sep = " "), where the `sep` argument tells R that we want to separate the joined elements with a single space.

paste("Hello", "world!", sep = " ")
#[1] "Hello world!"

#For a slightly more complicated example, we can join two vectors, each of length 3. Use paste() to join the integer vector 1:3 with the character vector c("X","Y", "Z"). 
#This time, use sep = "" to leave no space between the joined elements.

paste(1:3, c("X", "Y", "Z"), sep = "")
#[1] "1X" "2Y" "3Z"

paste(LETTERS, 1:4, sep = "-")

#[1] "A-1" "B-2" "C-3" "D-4" "E-1" "F-2" "G-3" "H-4" "I-1" "J-2" "K-3" "L-4" "M-1"
#[14] "N-2" "O-3" "P-4" "Q-1" "R-2" "S-3" "T-4" "U-1" "V-2" "W-3" "X-4" "Y-1" "Z-2"

#Since the character vector LETTERS is longer than the numeric vector 1:4, R simply recycles, or repeats, 1:4 until it matches the length of LETTERS.
#Also worth noting is that the numeric vector 1:4 gets 'coerced' into a character vector by the paste() function

#############################################################

#5: MISSING VALUES

#Missing values play an important role in statistics and data analysis. Often, missing values must not be ignored, but rather they should be carefully studied to see if there's an underlying pattern or cause for their missingness.
#In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense). In this lesson, we'll explore missing values further.

y <- rnorm(1000) #create a vector containing 1000 draws from a standard normal distribution

z <- rep(NA, 1000) 

#select 100 elements at random from these 2000 values (combining y and z) such that we don't know how many NAs we'll wind up with or what positions they'll occupy in our final vector.

my_data <- sample(c(y, z), 100)

my_na <- is.na(my_data)

my_na

#[1]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE
#[14] FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
#[27] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE
#[40] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE
#[53] FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE
#[66] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[79] FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
#[92] FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE

#Total number of NA's. as TRUE is 1 and FALSE is 0.

sum(my_na)
#[1] 40

#############################################################

#SUBSETTING VECTORS

#In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify.

#For example, we may only be interested in the first 20 elements of a vector, or only the elements that are not NA, or only those that are positive or correspond to a specific variable of interest.

#Let 'x' is a vector called x that contains a random ordering of 20 numbers (from a standard normal distribution) and 20 NAs

x[1:10] #First 10 element of x


#Index vectors come in four different flavors -- logical vectors, vectors of positive integers, vectors of negative integers, and vectors of character strings.

##INDEXING WITH LOGICAL VECTORS

x[is.na(x)] #All NA's values from x
#[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

x[!is.na(x)] #All non NA's values from x

x[!is.na(x) & x > 0] #All non NA and greater than 0 values of x


#Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is considered element 0. 
#R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is considered element 1

##INDEXING WITH VECTOR OF POSITVE INTEGERS

x[c(3, 5, 7)] # To subset the 3rd, 5th, and 7th elements of x

##INDEXING WITH VECTOR OF NEGATVE INTEGERS

x[c(-2, -10)] # To subset all the elements of x instead of 2nd and 10th.
#Or x[-c(2, 10)]


#############

#NAMED ELEMENTS

vect <- c(foo = 11, bar = 2, norf = NA)
vect
#foo  bar norf 
#11    2   NA 

names(vect)  #get the names of vect by passing vect as an argument to the names()
#[1] foo  bar norf 


vect2 <- c(11, 2, NA) #Unnamed vector

names(vect2) <- c("foo", "bar", "norf") #Passing names to unnamed vector

identical(vect, vect2) #To check if both vectors are same
#[1] TRUE

vect["bar"]
#bar
# 2

vect[c("foo", "bar")]
#foo bar 
#11   2 

x <- c("a", "b", "c", "d", "c")
x[x>"a"]
#[1] "b" "c" "d" "c"

u <- x>"a"
u
#[1] FALSE  TRUE  TRUE  TRUE  TRUE

x[u]
#[1] "b" "c" "d" "c"

#############################################################

##SUBSETTING MATRIX

x <- matrix(1:6, 2, 3)
x
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6

x[1, 2]       #Extract 1st row, 2nd column
#[1] 3

x[2, 1]       #Extract 1st row, 2nd column
#[1] 2

x[1, ]        #Extract 1st row, total columns
#[1] 1 3 5

x[ ,1]        #Extract 1st column, total rows
#[1] 1 2


#############################################################

#SUBSETTING LISTS

x <- list(foo = 1:4, bar = 0.6)

x[[1]] 
#[1] 1 2 3 4

x[1]
#$foo
#[1] 1 2 3 4

x$foo
#[1] 1 2 3 4



