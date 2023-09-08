library(nycflights13)
library(tidyverse)

?flighst

### Com o banco de dados flights do pacote nycflights13, respondam:
help(nycflights13)
flight <- nycflights13::flights

# 1- Find all flights that
# a) Had an arrival delay of two or more hours

#Coloquei 120, pq diz que os valores do arr_delay estão em minutos
arrival_delay <- filter(flight, arr_delay >= 120)


# b) Flew to Houston (IAH or HOU)

dest_houston <- filter(flight, dest %in% c("IAH", "HOU"))

# c) Departed in summer (July, August, and September)

dep_summer <- filter(flight, month %in% c(7,8,9))

# d) Arrived more than two hours late, but didn’t leave late

arr_more_twohours <- filter(flight, arr_delay > 120 & dep_delay <= 0 ) # & intersecção dos eventos

# e) Departed between midnight and 6am (inclusive)

#Fiquei confuso se 1 representa 1 hora da manha
dep_between <- filter(flight, dep_time <= 600 )
#filter(flight, between(dep_time, 0, 600)) Outra forma de fazer 

# 2- How many flights have a missing dep_time (Aqui ela queria a quantidade e não só visualizar quais eram)

miss_dep_time <- filter(flight, is.na(dep_time) ) %>% 
  summarise(Quantidade = n())

#Outra possibilidae é 
#nrow(miss_dep_time)
#sum(is.na(flight$dep_time))

# 3- Sort flights to find the most delayed flights

arrange(miss_dep_time, desc(dep_time))
#arrange(mis_dep_time, desc(arr_delay))
#caso pedisse as 10 primerias linhas 
#head(arrange(miss_dep_time, desc(dep_time)), n = 10)
#select(flightdesc, arr_delay, tailnum, everything())

# 4- Which flights travelled the farthest?

farthest <- filter(flight, distance == max(distance))

#arrange(flight, desc(distance))

# 5- Select variables containing the word time

time <- select(flight, contains("TIME"))
#?contains

# 6- Select variables ending with the word delay

delay<- select(flight, ends_with('DELAY'))


# 7- Add two variable: departed hour and departed minute

#Modular arithemetic (%/% and %%)
# Integer Division (%/%) and remainder(resto) (%%)
new_flight <- mutate(flight, departed_hour = dep_time %/% 100, departed_minute = dep_time %% 100)

# 8- Average departure delay per day (number of flights)

average_delay_per_day <- flight %>% 
  # filter(dep_delay >= 0) %>% 
  group_by(day, month) %>% 
  summarise(media = round(mean(dep_delay, na.rm = T),2),contagem = n())



# 9- Average departure delay by plane

avg_dep_delay <- flight %>% 
  # filter(dep_delay >= 0) %>% 
  group_by(tailnum) %>% 
  summarise(avg_plane_delay = round(mean(dep_delay, na.rm = T),2), contagem = n())

