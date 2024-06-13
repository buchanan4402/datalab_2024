#Load library
library(tidyverse)
library(dplyr)
#load clean data
dives <- read_csv("https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives.csv")

#load messy data
messy_dives <- read_csv("https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv")

#load MESSIER data (for cross referencing)
#messy_dives2 <- read_csv("https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv")

#making dates useable
messy_dives <- messy_dives %>% # add 2 uf checking code
  mutate(YEAR = str_pad(YEAR,width=3 ,side="left",pad=0)) %>%
  mutate(YEAR = str_pad(YEAR,width=4 ,side="left",pad=2)) %>%
  mutate(Day = str_pad(Day,width=2 ,side="left",pad=0)) %>%
  mutate(Month = str_pad(Month,width=2 ,side="left",pad=0)) %>% 
  mutate(sit = substr(sit,10,12))

#create id column
messy_dives$id <- paste0(messy_dives$YEAR, messy_dives$Month, messy_dives$Day, messy_dives$sit)

#delete YEAR Month Day and sit
messy_dives <- subset(messy_dives, select = -c(YEAR, Month, Day, sit))

#reorder and rename columns
messy_dives <- messy_dives %>% select(id, Species.ID, bhvr, PreyVolume, PreyDepth, Dive_Time, Surfacetime, Blow.Interval, Blow_number_count)


 names(messy_dives) <- c("id", #"id" 
                    "species", #"Species.ID", 
                    "behavior", #bhvr", 
                    "prey.volume",#PreyVolume", 
                    "prey.depth", #"PreyDepth", 
                    "dive.time", #"Dive_Time", 
                    "surface.time", # "Surfacetime", 
                    "blow.interval", #"Blow.Interval", 
                    "blow.number" # "Blow_number_count")
                    )

 messy_dives <- messy_dives %>% 
   na.omit()
 
 messy_dives <- messy_dives %>% 
   distinct()
 
 #remove improper sintax
 messy_dives<-messy_dives %>%
   mutate(species= case_when(species%in%c('fin', 'finbender', 'FinW', 'FinWhale' ~ 'FW')))
 
 
 test <- messy_dives %>% 
   mutate(id = as.numeric(id))


