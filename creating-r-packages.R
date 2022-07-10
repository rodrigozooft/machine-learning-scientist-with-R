# Use the create function to set up your first package
create('datasummary')

# Take a look at the files and folders in your package
dir('datasummary')

# Create numeric_summary() function
numeric_summary <- function(x, na.rm) {

    # Include an error if x is not numeric
    if(!is.numeric(x)){
        stop("Data must be numeric")
    }
    
    # Create data frame
    data.frame( min = min(x, na.rm = na.rm),
                median = median(x, na.rm = na.rm),
                sd = sd(x, na.rm = na.rm),
                max = max(x, na.rm = na.rm))
}

# Test numeric_summary() function
numeric_summary(airquality$Ozone, na.rm = TRUE)

# What is in the R directory before adding a function?
dir("datasummary/R")

# Use the dump() function to write the numeric_summary function
dump("numeric_summary", file = "datasummary/R/numeric_summary.R")

# Verify that the file is in the correct directory
dir("datasummary/R")