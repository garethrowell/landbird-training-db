
###############################################################
#
# Creating a list of unique EventIDs for Null observers
#
# Gareth Rowell - 20240829
#
###############################################################


library(tidyverse)

setwd("../work/ryanburner/20240821-ObserverDataTested")



df_lj <- read_csv("HTLN_bird_observations_observers_LEFTJOIN.csv")
problems(df_lj)
glimpse(df_lj)

# total count of bird observations by ObserverInitials
	
df_lj |>
    count(ObserverInitials) |>
	arrange(desc(n)) |>
	print(n = 102)


# total count of bird observations grouped by ObserverInitials and Year.

df_lj <- df_lj |> 
	mutate(
	    ObsYear = year(EventDateTime)
	)


df_lj |> 
  group_by(ObserverInitials, ObsYear) |> 
  count() |>
  arrange(desc(n))
 
  
# filtering for NULL observations
# create unique list of EventIDs


 df_null <- df_lj |>
      select(EventID, ObserverInitials) |>
	  filter(ObserverInitials == "NULL") |>
	  distinct(EventID, ObserverInitials) |>
      arrange(EventID)

glimpse(df_null)

# need to split EventID and insert "Tweety"	 

df_null$EventID[1:4] 

df_null <- df_null |>
	mutate(
		part1 = str_sub(EventID, 1, 4),
        part2 = str_sub(EventID, 5),
		EventID = str_c(part1, "Tweety", part2)
	)
	
df_null <- df_null |>
      select(EventID, ObserverInitials)
	  
	  
writexl::write_xlsx(df_null, "EventIDs_null_observers.xlsx")	  
	  
