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