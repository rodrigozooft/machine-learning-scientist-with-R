# Print the first 6 rows
head(songs, 6)

# Print the structure
str(songs)

# Create the model here
lm_model <- lm(popularity ~ song_age, data = songs)

# Produce the summary
summary(lm_model)

# Print a tidy summary of the coefficients
tidy(lm_model)

# Create the model here
stan_model <- stan_glm(popularity ~ song_age, data = songs)

# Produce the summary
summary(stan_model)

# Print a tidy summary of the coefficients
tidy(stan_model)

# Create the 90% credible intervals
posterior_interval(stan_model)

# Create the 95% credible intervals
posterior_interval(stan_model, prob = 0.95)

# Create the 80% credible intervals
posterior_interval(stan_model, prob = 0.8)

# 3 chains, 1000 iterations, 500 warmup
model_3chains <- stan_glm(popularity ~ song_age, data = songs,
    chains = 3, iter = 1000, warmup = 500)

# Print a summary of model_3chains
summary(model_3chains)

# 2 chains, 100 iterations, 50 warmup
model_2chains <- stan_glm(popularity ~ song_age, data = songs,
    chains = 2, iter = 100, warmup = 50)

# Print a summary of model_2chains
summary(model_2chains)

# Estimate the model
stan_model <- stan_glm(popularity ~ song_age, data = songs)

# Print a summary of the prior distributions
prior_summary(stan_model)

# Calculate the adjusted scale for the intercept
10 * sd(songs$popularity)

# Calculate the adjusted scale for `song_age`
(2.5 / sd(songs$song_age)) * sd(songs$popularity)

# Calculate the adjusted scale for `valence`
(2.5 / sd(songs$valence)) * sd(songs$popularity)

# Estimate the model with unadjusted scales
no_scale <- stan_glm(popularity ~ song_age, data = songs,
    prior_intercept = normal(autoscale = FALSE),
    prior = normal(autoscale = FALSE),
    prior_aux = exponential(autoscale = FALSE)
)

# Print the prior summary
prior_summary(no_scale)