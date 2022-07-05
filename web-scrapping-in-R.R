html_excerpt_raw <- '
<html> 
  <body> 
    <h1>Web scraping is cool</h1>
    <p>It involves writing code – be it R or Python.</p>
    <p><a href="https://datacamp.com">DataCamp</a> 
		has courses on it.</p>
  </body> 
</html>'
# Turn the raw excerpt into an HTML document R understands
html_excerpt <- read_html(html_excerpt_raw)
html_excerpt
# Print the HTML excerpt with the xml_structure() function
xml_structure(html_excerpt)

# Read in the corresponding HTML string
list_html <- read_html(list_raw_html)
# Extract the ol node
ol_node <- list_html %>% 
	html_node('ol')
# Extract and print the nodeset of all the children of ol_node
ol_node %>%
	html_children()

# Extract all the a nodes from the bulleted list
links <- hyperlink_raw_html %>% 
  read_html() %>%
  html_nodes('li a') # 'ul a' is also correct!

# Extract the needed values for the data frame
domain_value = links %>% html_attrs()
name_value = links %>% html_text()

# Construct a data frame
link_df <- tibble(
  domain = domain_value,
  name = name_value
)

link_df

# Extract the "dirty" table into a data frame
mountains <- mountains_html %>% 
  html_node("table#dirty") %>% 
  html_table(header = TRUE, fill = TRUE)

mountains

# Read in the HTML
languages_html <- read_html(languages_raw_html)
# Select the div and p tags and print their text
languages_html %>%
	html_nodes('div, p') %>%
	html_text()

# Select the first div
structured_html %>%
  html_nodes('#first')

# This time for real: Select only the last node of the p's wrapped by the div
nested_html %>%
	html_nodes('p:last-child.text')

# Extract the text of all list elements
languages_html %>% 
	html_nodes('li') %>% 
	html_text()

# Extract only the text of the computer languages (without the sub lists)
languages_html %>% 
	html_nodes('ul#languages > li') %>% 
	html_text()

# Select the three divs with a simple selector
complicated_html %>%
	html_nodes('div div')

# Select only the first code element in the second example
code_html %>% 
	html_nodes('h2.second + code')

# Select all code elements in the second example
code_html %>% 
	html_nodes('h2.second ~ code')

# Select all p elements
weather_html %>%
	html_nodes(xpath = '//p')

# Select p elements with the second class
weather_html %>%
	html_nodes(xpath = "//p[@class = 'second']")

# Select p elements that are children of "#third"
weather_html %>%
	html_nodes(xpath = '//*[@id = "third"]//p')

# Select p elements with class "second" that are children of "#third"
weather_html %>%
	html_nodes(xpath = '//*[@id = "third"]//p[@class = "second"]')

  # Select all divs
weather_html %>% 
  html_nodes(xpath = '//div')

# Select all divs with p descendants
weather_html %>% 
  html_nodes(xpath = '//div[p]')

# Select all divs with p descendants having the "third" class
weather_html %>% 
  html_nodes(xpath = '//div[p[@class = "third"]]')

# Select the text of the second p in every div
rules_html %>% 
  html_nodes(xpath = '//div/p[position() = 2]') %>%
  html_text()

# Select the text of the second p in every div
rules_html %>% 
  html_nodes(xpath = '//div/p[position() != 2]') %>%
  html_text()

# Select the text of the last three nodes of the second div
rules_html %>% 
  html_nodes(xpath = '//div[position() = 2]/*[position() >= 2]') %>%
  html_text()