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

# What is in the package at the moment?
dir("datasummary")

# Add the weather data
use_data(weather, pkg = "datasummary", overwrite = TRUE)

# Add a vignette called "Generating Summaries with Data Summary"
use_vignette("Generating_Summaries_with_Data_Summary", pkg = "datasummary")

# What directories do you now have in your package now?
dir("datasummary")

data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = TRUE, .id = "ID")
  
}

# Write the function to the R directory
dump("data_summary", file = "datasummary/R/data_summary.R")

# Add a title and description
#' Numeric Summaries
#' 
#' Summarises numeric data and returns a data frame containing the minimum value, median, standard deviation, and maximum value.
#' 
#' 
numeric_summary <- function(x, na.rm){

    if(!is.numeric(x)){
        stop("Data must be numeric")
    }
    
    data.frame( min = min(x, na.rm = na.rm),
                median = median(x, na.rm = na.rm),
                sd = sd(x, na.rm = na.rm),
                max = max(x, na.rm = na.rm))
}

#' Numeric Summaries
#'
#' Summarises numeric data and returns a data frame containing the minimum value, median, standard deviation, and maximum value.
#'
# Add appropriate tag and details to document the first argument
#' @param x a numeric vector containing the values to summarize.
numeric_summary <- function(x, na.rm){

    if(!is.numeric(x)){
        stop("data must be numeric")
    }
    
    data.frame( min = min(x, na.rm = na.rm),
                median = median(x, na.rm = na.rm),
                sd = sd(x, na.rm = na.rm),
                max = max(x, na.rm = na.rm))
}

#' Summary of Numeric Columns
#'
#' Generate specific summaries of numeric columns in a data frame
#' 
#' @param x A data frame. Non-numeric columns will be removed
#' @param na.rm A logical indicating whether missing values should be removed
#' @import purrr
#' @import dplyr
#' @importFrom tidyr gather
data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "ID")
  
}

#' Summary of Numeric Columns
#'
#' Generate specific summaries of numeric columns in a data frame
#' 
#' @param x A data frame. Non-numeric columns will be removed
#' @param na.rm A logical indicating whether missing values should be removed
#' @import dplyr
#' @import purrr
#' @importFrom tidyr gather
#' @export data_summary
data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "ID")
  
}
#' Data Summary for Numeric Columns
#'
#' Custom summaries of numeric data in a provided data frame
#'
#' @param x A data.frame containing at least one numeric column
#' @param na.rm A logical indicating whether missing values should be removed
#' @import dplyr
#' @import purrr
#' @importFrom tidyr gather
#' @export
#' @examples
#' data_summary(iris)
#' data_summary(airquality, na.rm = FALSE)
data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "ID")
  
}

#' Data Summary for Numeric Columns
#'
#' Custom summaries of numeric data in a provided data frame
#'
#' @param x A data.frame containing at least one numeric column
#' @param na.rm A logical indicating whether missing values should be removed
#' @import dplyr
#' @import purrr
#' @importFrom tidyr gather
#' @export
#' @examples
#' data_summary(iris)
#' data_summary(airquality, na.rm = FALSE)
#'
## Update the details for the return value
#' @return This function returns a \code{data.frame} including columns:
#' \itemize{
#'  \item ID
#'  \item min
#'  \item median
#'  \item sd
#'  \item max
#' }
#'
#' @export
data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "ID")
  
}

#' Summary of Numeric Columns
#' Generate specific summaries of numeric columns in a data frame
#'
#' @param x A data frame. Non-numeric columns will be removed
#' @param na.rm A logical indicating whether missing values should be removed
#' @import dplyr
#' @import purrr
#' @importFrom tidyr gather
#' @export
#' @examples
#' data_summary(iris)
#' data_summary(airquality, na.rm = FALSE)
#' 
#' @return This function returns a \code{data.frame} including columns: 
#' \itemize{
#'  \item ID
#'  \item min
#'  \item median
#'  \item sd
#'  \item max
#' }
#'
## Add in the author of the `data_summary()` function
#' @author My Name <myemail@example.com>
## List the `summary()` function (from the `base` package)
#' @seealso \link[base]{summary}
data_summary <- function(x, na.rm = TRUE){
  
  num_data <- select_if(x, .predicate = is.numeric) 
  
  map_df(num_data, .f = numeric_summary, na.rm = na.rm, .id = "ID")
  
}

#' Custom Data Summaries
#'
#' Easily generate custom data frame summaries
#'
#' @docType package
#' @name datasummary
"_PACKAGE"

#' Random Weather Data
#'
#' A dataset containing randomly generated weather data.
#'
#' @format A data frame of 7 rows and 3 columns
#' \describe{
#'  \item{Day}{Numeric values giving day of the week, 1 = Monday, 7 = Sunday}
#'  \item{Temp}{Numeric values}
#'  \item{Weather}{Categorical variable that takes snow, sun r rain}
#' }
#' @source Randomly generated data
"weather"

# Generate package documentation
document("datasummary")

# Examine the contents of the man directory
dir("datasummary/man")

# View the documentation for the data_summary function
help("data_summary")

# View the documentation for the weather dataset
help("weather")

# Check your package
check("datasummary")

#' Numeric Summaries
#' Summarises numeric data and returns a data frame containing the minimum value, median, standard deviation, and maximum value.
#'
#' @param x a numeric vector containing the values to summarize.
#' @param na.rm a logical value indicating whether NA values should be stripped before the computation proceeds
numeric_summary <- function(x, na.rm){

  if(!is.numeric(x)){
    stop("data must be numeric")
  }

  data.frame( min = min(x, na.rm = na.rm),
              median = median(x, na.rm = na.rm),
              sd = sd(x, na.rm = na.rm),
              max = max(x, na.rm = na.rm))
}