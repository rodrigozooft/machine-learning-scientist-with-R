# Count the number of functions in ggplot2
no_of_functions <- length(getNamespaceExports("ggplot2"))

# Load the dplyr and conflicted packages
library("dplyr")
library("conflicted")

# Prefer the dplyr version of the lag function
conflict_prefer("lag", "dplyr")

# This should return NA, 1, 2, 3
lag(1:4)

# Define F to be interpreted as TRUE
F > TRUE

# Read in data: don't alter the line below
data_set <- read.csv("iris.csv", header = F)

suppressPackageStartupMessages(library("dplyr"))

# Suppress the standard output of the simulate() function
sim = suppressMessages(simulate(runs = 5))

# Modify the function to make it less noisy
get_distribution <- function(N, verbose = TRUE) {
  results <- numeric(N)
  for(i in 1:N) {
    results[i] <- simulate()
    # Check if verbose is TRUE
    if(isTRUE(verbose)) {
      # Show a progress report
      message("Simulation ", i, " completed")
    }
  }
  return(results)
}

# Create new variable 
x <- c(1, 1, 1)
y <- 1:3

# Suppress the warning
m <- suppressWarnings(cor(x, y))

mean_age = function(ages) {
  if(any(ages < 0)) {
    stop("You have negative ages!")
  }
  # Stop the execution if any of the ages are over 150
  if(any(ages > 150)) {
    stop("It is not your granny")
  }
  m = mean(ages)
  return(m)
}

m <- mean(x); s <- sd(x); n <- length(x)
c(m - 1.96 * s/sqrt(n), m + 1.96 * s/sqrt(n))

m <- mean(y); s <- sd(y); n <- length(y)
c(m - 1.96 * s/sqrt(n), m + 1.96 * s/sqrt(n))

# Define a function to prevent pasting the code above
ci <- function(values) {
  n <- length(values)
  m <- mean(values) 
  s <- sd(values) 
  c(m - 1.96 * s / sqrt(n), m + 1.96 * s / sqrt(n))
}

# Define a function to prevent pasting the code above
ci <- function(x, plot_it = FALSE) {
  # Plot the data
  if (isTRUE(plot_it)) hist(x)
  
  m <- mean(x); s <- sd(x); n <- length(x)
  c(m - 1.96 * s/sqrt(n), m + 1.96 * s/sqrt(n))
}

# Generate 100 normal random numbers
sample_values <- rnorm(100)
ci(sample_values)

# Fix the code
f <- function(x, y, z) {
x + y + z
}

# Fix the code
summarise_data <- function(values) {
  c(mean(values), median(values))
}

stats <- summarise_data(runif(10))