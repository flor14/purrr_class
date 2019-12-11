### CLASE
#le preguntaria a los chicos si me entienden
# Primero explicar map

library(tidyverse)
library(gapminder)


latam <- c("Argentina", "Brazil", "Chile", "Uruguay")
latam2 <-  str_c(latam, ".csv", sep="")


for (i in seq_along(latam)){
  gapminder %>% 
    select(-c(gdpPercap, continent)) %>% 
    filter(country == latam[i]) %>% 
    write_csv(latam2[i])
  
}