data <- c(1, 0, 0, 1)
prop_model(data)

# Update the data and rerun prop_model
data = c(1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0)
prop_model(data)

data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)

# Extract and explore the posterior
posterior <- prop_model(data)
head(posterior)

# Edit the histogram
hist(posterior, breaks = 30, xlim = c(0, 1), col = 'palegreen4')

data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)
posterior <- prop_model(data)
hist(posterior, breaks = 30, xlim = c(0, 1), col = "palegreen4")

# Calculate the median
median(posterior)

data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)
posterior <- prop_model(data)
hist(posterior, breaks = 30, xlim = c(0, 1), col = "palegreen4")

# Calculate some measures of interest using the posterior
median(posterior)

# Calculate the credible interval
quantile(posterior, c(0.05, 0.95))


data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)
posterior <- prop_model(data)
hist(posterior, breaks = 30, xlim = c(0, 1), col = "palegreen4")

# Calculate the median
median(posterior)

# Calculate the credible interval
quantile(posterior, c(0.05, 0.95))

# Calculate the sum
sum(posterior > 0.07)

# Calculate the probability
sum(posterior > 0.07) / length(posterior)

# The generative zombie drug model

# Set parameters
prop_success <- 0.42
n_zombies <- 100

# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}
data <- as.numeric(data)
data

# The generative zombie drug model

# Set parameters
prop_success <- 0.42
n_zombies <- 100

# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}

# Count cured
data <- sum(data)
data

# Chenge the parameters
rbinom(n = 1, size = 100, prob = 0.42)

# Chenge the parameters
rbinom(n = 200, size = 100, prob = 0.42)

# Fill in the parameters
n_samples <- 100000
n_ads_shown <- 100
proportion_clicks <- 0.1
n_visitors <- rbinom(n_samples, size = n_ads_shown, 
                     prob = proportion_clicks)

# Visualize n_visitors
hist(n_visitors)

n_samples <- 100000
n_ads_shown <- 100

# Update proportion_clicks
proportion_clicks <- runif(n = n_samples, min = 0.0, max = 0.2)

n_visitors <- rbinom(n = n_samples, size = n_ads_shown, prob = proportion_clicks)

# Create the prior data frame
prior <- data.frame(proportion_clicks, n_visitors)

# Examine the prior data frame
head(prior)

# Create the posterior data frame
posterior <- prior[prior$n_visitors == 13, ]

# Create the prior data frame
prior <- data.frame(proportion_clicks, n_visitors)

hist(posterior$proportion_clicks)