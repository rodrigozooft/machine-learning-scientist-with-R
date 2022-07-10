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