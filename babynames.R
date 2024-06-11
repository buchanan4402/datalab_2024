library(babynames)
library(ggplot2)
library(dplyr)
library(tidyverse)





# 9) Make an object called bb_names by running babynames <- bb_names.
bb_names <- babynames

# 10) Create a histogram of the name Marie in 1982.
ggplot(bb_names %>% filter(year >= 1982) %>% filter(name == "Marie"), aes(x = year))+
  geom_histogram()

# 11) Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.
ggplot(bb_names %>% filter(name == "Joe"), aes(x = year, y = prop, col = sex))+
  geom_line(alpha = 0.5, linewidth = 1)
  
# 12) Add new x and y axis labels, as well as a chart title.
ggplot(bb_names %>% filter(name == "Joe"), aes(x = year, y = prop, col = sex))+
  geom_line(alpha = 0.5, linewidth = 1)+
  labs(
    x = "Year",
    y = "Proportion of Joe Name Occurance",
    title = "Proportion of Joe Name Occurance vs Year"
  )

# 13) Create a bar chart of top 5 female names in 2002.
ggplot(bb_names %>% 
         filter(sex == "F") %>% 
         filter(year == 2002) %>% 
         arrange(desc(prop)) %>% 
                   head(5) %>% 
         mutate(name=fct_reorder(factor(name),desc(prop))), aes(x = name, y = prop) )+
  geom_col(alpha = 0.8, color = 'orange', fill = 'red' )

# 14) Make the bars transparent and filled with the color blue.


# 15) Create a new data set called the_nineties that only contains years from the 1990s
the_ninties <- bb_names %>% 
  filter(year >= 1990) %>% 
  filter(year < 2000)

# 16) Save this dataset to your repository (use write.csv()).
write.csv(the_ninties, "the_ninties.csv")

# 17) Add, commit, and push your files to GitHub.

