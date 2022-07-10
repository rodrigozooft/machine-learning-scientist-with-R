# Count the number of functions in ggplot2
no_of_functions <- length(getNamespaceExports("ggplot2"))

# Load the dplyr and conflicted packages
library("dplyr")
library("conflicted")

# Prefer the dplyr version of the lag function
conflict_prefer("lag", "dplyr")

# This should return NA, 1, 2, 3
lag(1:4)