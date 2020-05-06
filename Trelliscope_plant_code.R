devtools::install_github("hafen/trelliscopejs")
install.packages(c("readr", "dplyr"))

library(readr)
library(dplyr)
library(trelliscopejs)

# read the data (making "_id" columns strings)
pok <-
  read_csv("C:/Users/Amanda B. Young/Documents/website/plant_key/plants_web.csv") %>%
  mutate_at(vars(matches("_id$")), as.character)

# take a look
glimpse(pok)


pok %>%
  mutate(panel = img_panel(url)) %>%
  trelliscope("Toolik Plant Key", nrow = 3, ncol = 6,
              state = list(labels = c("Latin", "common")))

