# Toolik_Plant_Key
Attempt to make a plant key using shiny 

This code is adapted from https://hafen.github.io/trelliscopejs
to make an interactive plant key that allows the user to search via plant name (latin and common), flower colour, flower shape, leaf colour, etc. 



library(readr)
library(dplyr)
library(trelliscopejs)

# read the data (making "_id" columns strings)
TFS_flora <-
  read_csv("C:/Users/Amanda B. Young/Documents/website/plant_key/plants_web.csv") %>%
  mutate_at(vars(matches("_id$")), as.character)

# take a look
glimpse(TFS_flora)


TFS_flora %>%
  mutate(panel = img_panel(url)) %>%
  trelliscope("Toolik Plant Key", nrow = 3, ncol = 6,
              state = list(labels = c("Latin", "common")))

