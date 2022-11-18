# -*- coding: utf-8 -*-

# -- Sheet --

# # **NYC Flight 2013 **Analysis****


library(dplyr)
library(tidyverse)

flights <- read_csv("flights.csv")
airlines <- read_csv("airlines.csv")
airports <- read_csv("airports.csv")

glimpse(flights)
glimpse(airlines)
glimpse(airports)

# ## Q1: Which airlines have the most flights?


flights %>% 
left_join(airlines, "carrier") %>%
select(name) %>%
count(name) %>%
arrange(desc(n))




# **Ans :** United Air Lines Inc. 58665 flights


# ## Q2 : Which airlines have the most departure delay in 2013 ?


avg_dep_delay_airlines <- airlines %>%
select(carrier,name) %>%
mutate(Airlines_name = name) %>%
left_join(flights, "carrier") %>%
select(Airlines_name, month, carrier, dep_delay) %>%
group_by(Airlines_name) %>%
filter(!is.na(dep_delay), dep_delay >= 0 ) %>%
summarise(avg_dep_delay_Minute = mean(dep_delay)) %>%
arrange(desc(avg_dep_delay_Minute))

avg_dep_delay_airlines

# **Ans :** SkyWest Airlines Inc.


# ## Q3 : How relative between flights and departure delay ?


relative_flight_depDelay <- flights %>%
left_join(airlines, "carrier") %>%
select(name) %>%
count(name) %>%
mutate(c_flights = n ) %>%
select(name, c_flights) %>%
left_join(avg_dep_delay_airlines, c("name" = "Airlines_name")) %>%
arrange(desc(c_flights))

relative_flight_depDelay

plot(relative_flight_depDelay$c_flights, relative_flight_depDelay$avg_dep_delay_Minute,
     main = "Flights vs Departure delay",
     xlab = "Flights",
     ylab = "Departure delay (minute)") 

# **Ans :** The airlines less flights have chance high departure delay.


# ## Q4 : Which airlines have longest and shortest distance ?


max_min_dis <- flights %>%
left_join(airlines, "carrier") %>%
group_by(name) %>%
select(carrier, Airlines_name = name, distance) %>%
summarise(Max_dis = max(distance),
          Min_dis = min(distance)) %>%
arrange(desc(Max_dis))

max_min_dis

# **Ans :** longest distance -> Hawaiian Airlines Inc. 4983 miles
#   
#         shortest distance -> US Airways Inc. 17 miles


# ## Q5 : Longest and shortest distance from where to where ?


long_short_dis <- distinct(flights %>%
left_join(airlines, "carrier") %>%
select(Airlines_name = name, distance, origin, dest) %>%
filter( distance == c(4983, 17))
)

long_short_dis %>%
left_join(airports, c("origin" = "faa")) %>%
select(Airlines_name, distance, origin_name = name, dest) %>%
left_join(airports, c("dest" = "faa")) %>%
select(Airlines_name, distance, origin_name, dest_name = name)

# **Ans :** Hawaiian Airlines Inc. 4983 miles from John F Kennedy Intl to Honolulu Intl
# 
# US Airways Inc. 17 miles from Newark Liberty Intl 


