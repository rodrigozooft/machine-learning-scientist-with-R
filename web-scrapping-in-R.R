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