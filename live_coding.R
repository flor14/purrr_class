## LIVE CODING #1: READING FILES WITH MAP()

# First, call the library
library(tidyverse)

# Steps
  
# 1. Build a vector of files do you want to iterate over
# 2. Select a function to read the files 
# 3. Check the number of arguments the function need
# 4. Select among map()/map2()/pmap()
# 5. Select map_*() suffix in relation of the desired output
  

  
# Steps

# 1. Build a vector of files do you want to iterate over

countries <- list.files(pattern = "\\.csv$")

# 2. Select a function to read the files 
# 3. Check the number of arguments the function need
# 4. Select among map()/map2()/pmap()

readr::read_csv(countries[1])

# 5. Select map_*() suffix in relation of the desired output

latam <- purrr::map_df(countries, read_csv)

# We can plot all the countries now!
ggplot(latam, aes(year, pop, color = country))+
  geom_point()

---------------------------------------------------
  ## LIVE CODING 2: AUTOMATIZED GENERATION OF REPORTS

library(rmarkdown)

# we need 

# function to generate the files
# template.rmd
# params
# output_file

------

# explore rmd file  
  
# function to generate the files
# template.rmd
rmarkdown::render("report_latam.Rmd")


# params
# output_file

reports <- tibble(country = unique(latam$country),
       output_file = str_c("report_", country, ".html", sep = ""),
       params = map(country, ~list(country = .)))

# generate reports
reports %>% 
  select(-country) %>% 
  purrr::pwalk(rmarkdown::render, "report_latam.Rmd")


# remember to improve your plots for communication!

