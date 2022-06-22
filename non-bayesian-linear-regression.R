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