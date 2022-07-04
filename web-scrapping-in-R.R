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